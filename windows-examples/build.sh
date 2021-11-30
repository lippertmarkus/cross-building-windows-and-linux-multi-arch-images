TARGETIMAGE=${1:-lippertmarkus/test:1.0}
BASE="mcr.microsoft.com/windows/nanoserver"
OSVERSIONS=("1809" "1903" "1909" "2004" "20H2" "ltsc2022")
MANIFESTLIST=""

for VERSION in ${OSVERSIONS[*]}
do 
    docker buildx build --platform windows/amd64 --push --pull --build-arg WINBASE=${BASE}:${VERSION} -t "${TARGETIMAGE}-${VERSION}" .
    MANIFESTLIST+="${TARGETIMAGE}-${VERSION} "
done

docker manifest rm $TARGETIMAGE > /dev/null 2>&1
docker manifest create $TARGETIMAGE $MANIFESTLIST

for VERSION in ${OSVERSIONS[*]}
do 
  docker manifest rm ${BASE}:${VERSION} > /dev/null 2>&1
  full_version=`docker manifest inspect ${BASE}:${VERSION} | grep "os.version" | head -n 1 | awk '{print $$2}' | sed 's@.*:@@' | sed 's/"//g'`  || true; 
  docker manifest annotate --os-version ${full_version} --os windows --arch amd64 ${TARGETIMAGE} "${TARGETIMAGE}-${VERSION}"
done

docker manifest push $TARGETIMAGE