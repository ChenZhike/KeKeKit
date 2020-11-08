Pod::Spec.new do |s|
    s.name         = "KeKeKit"
    s.version      = "0.0.11"
    s.source       = { :git => "https://github.com/ChenZhike/KeKeKit.git", :tag => "v0.0.11" }
s.platform     = :ios, '10.0'            #支持的平台及版本
    s.ios.deployment_target = '10.0'
    s.summary      = "'A delightful iOS common framework."
    s.homepage     = "https://github.com/ChenZhike/KeKeKit"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { 'KeKe' => 'a62396@126.com' }
    s.social_media_url   = "https://github.com/ChenZhike/KeKeKit"

    s.source_files  = "KeKeKit/core/*.{h,m}"
s.prefix_header_contents = <<-EOS
 #ifdef __OBJC__
#import "KeKeKit-Category.h"   //KeKeKit-Category.h包含了所有头文件
 #endif 
EOS
end
	s.frameworks = 'UIKit'
	s.dependency 'SDWebImage'
	s.dependency 'Wonderful'
	s.dependency 'SVProgressHUD'
    s.requires_arc = true

end