platform :ios, '15.0'
use_frameworks!

target 'Drevmass' do
  pod 'SnapKit'
  pod 'Alamofire', '~> 5'
  pod 'SwiftyJSON'
  pod 'SDWebImage'
  pod 'UIGradient'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end
