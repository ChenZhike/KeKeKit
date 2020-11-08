# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'KeKeKit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
pod 'SDWebImage'
pod 'Wonderful'
pod 'SVProgressHUD'

  # Pods for KeKeKit
post_install do |installer|
  installer.pods_project.targets.each do |target|
 target.build_configurations.each do |config|
  if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 8.0
    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
     end
   end
  end
end

end
