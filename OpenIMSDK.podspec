Pod::Spec.new do |s|
  s.name = "OpenIMSDK"
  s.version = "3.9.0"
  s.summary = "OpenIM: An instant messaging (IM) SDK developed by former WeChat engineers, based on Go. The iOS version of the IM SDK can easily replace third-party IM cloud services and build apps with chat and social functions."
  s.homepage = 'https://github.com/openimsdk/open-im-sdk-ios'
  s.license = { :type => 'MIT', :file => 'Sources/LICENSE' }
  s.author = { 'openim' => 'https://github.com/openimsdk/open-im-sdk-ios' }
  s.source = { :git => 'https://github.com/openimsdk/open-im-sdk-ios.git', :tag => s.version.to_s }

  s.platforms = { :ios => '13.0' }
  s.swift_versions = ["5.7"]
  s.source_files = 'Sources/**/*.{h,m,swift}'

  s.frameworks = 'Foundation'
  s.libraries = 'resolv'

  s.static_framework = true
  s.vendored_frameworks = 'Framework/OpenIMSDKCore.xcframework'
  
  s.dependency 'SwiftProtobuf', '1.28.2'

 s.resource_bundles = {
   "Privacy" => ["Sources/OpenIMSDK/PrivacyInfo.xcprivacy"]
 }
end
