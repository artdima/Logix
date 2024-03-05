FW=Logix.framework
XFW=Logix.xcframework

# builds iOS slice
xcodebuild archive -scheme Logix-iOS -configuration Release -destination 'generic/platform=iOS' -archivePath "./archives/$FW-iphoneos.xcarchive" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
# builds iOS simulator slice
xcodebuild archive -scheme Logix-iOS -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath "./archives/$FW-iphonesimulator.xcarchive" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
# merges both into .xcframework
rm -rf "$XFW"
xcodebuild -create-xcframework -framework "./archives/$FW-iphonesimulator.xcarchive/Products/Library/Frameworks/$FW" \
                               -framework "./archives/$FW-iphoneos.xcarchive/Products/Library/Frameworks/$FW" \
                               -output "$XFW"