platform :ios, '12.0'
use_frameworks!
target 'ios-nulp-schedule' do
  pod 'ReactiveSwift', '~> 6.1'
  pod 'ReactiveCocoa', '~> 10.1'
  pod 'SwiftSoup'
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
  end
 end
end