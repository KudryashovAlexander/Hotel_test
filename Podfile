# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

target 'Hotel_test' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for Hotel_test
  pod 'SwiftGen', '6.6.2'
  pod 'SwiftLint', '0.52.4'
  pod 'Kingfisher', '~> 7.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
