cd ..

DESTINATION='platform=iOS Simulator,name=iPhone 8,OS=latest'
WORKSPACE="FunChatik.xcworkspace"
SDK="iphonesimulator"
SCHEME="FunChatik"
XCTESTRUNPATH=Jenkins/build/Build/Products/${SCHEME}_iphonesimulator*-x86_64.xctestrun

build() {
    rm -rf Jenkins/build
    mkdir -p Jenkins/build
    echo "Jenkins.sh: Building"

    xcodebuild \
    -workspace "${WORKSPACE}" \
    -scheme "${SCHEME}" \
    -sdk "${SDK}" \
    -destination "${DESTINATION}" \
    -derivedDataPath Jenkins/build \
    clean build-for-testing
}

run() {
    echo "Jenkins.sh: Testing"
    rm -rf Jenkins/build/reports

    xcodebuild test-without-building \
    -xctestrun ${XCTESTRUNPATH} \
    -destination "${DESTINATION}" | xcpretty -r junit -r html
}

#build
run
