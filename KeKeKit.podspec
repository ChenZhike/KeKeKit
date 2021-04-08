Pod::Spec.new do |s|
    s.name         = "KeKeKit"
    s.version      = "0.0.52"
    s.source       = { :git => "https://github.com/ChenZhike/KeKeKit.git", :tag => "v0.0.52" }
s.platform     = :ios,'10.0'            #支持的平台及版本
    s.ios.deployment_target = '10.0'
    s.summary      = "'A delightful iOS common framework."
    s.homepage     = "https://github.com/ChenZhike/KeKeKit"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { 'KeKe' => 'a62396@126.com' }
    s.social_media_url   = "https://github.com/ChenZhike/KeKeKit"

    s.source_files  = "KeKeKit/core/*.{h,m}","KeKeKit/core/service/choose/*.{h,m}","KeKeKit/core/service/chooseperson/*.{h,m}","KeKeKit/core/service/file/*.{h,m}","KeKeKit/core/service/advertise/*.{h,m}","KeKeKit/core/service/guide/*.{h,m}","KeKeKit/core/service/color-picker/*.{h,m}","KeKeKit/core/service/Qrcode/*.{h,m}","KeKeKit/core/service/photoBrowser/*.{h,m}","KeKeKit/core/category/*.{h,m}","KeKeKit/core/ui/*.{h,m}","KeKeKit/core/ui/cell/*.{h,m}","KeKeKit/core/ui/label/*.{h,m}","KeKeKit/core/ui/window/*.{h,m}","KeKeKit/core/ui/button/*.{h,m}","KeKeKit/core/view/*.{h,m}","KeKeKit/core/view/DCCycleScrollView/*.{h,m}","KeKeKit/core/view/CarouseView/*.{h,m}","KeKeKit/core/shebeihao/*.{h,m}","KeKeKit/core/jiami/RNCryptor/*.{h,m}","KeKeKit/core/net/*.{h,m}","KeKeKit/core/user/*.{h,m}","KeKeKit/core/project_stand/*.{h,m}","KeKeKit/core/vcs/*.{h,m}"
s.prefix_header_file = 'KeKeKit/core/KeKeKit-PrefixHeader.pch'

	s.frameworks = 'UIKit'
	s.dependency 'SDWebImage'
	s.dependency 'Wonderful'
	s.dependency 'SVProgressHUD'
	s.dependency 'MJRefresh'
	s.dependency 'AFNetworking'
	s.dependency 'IQKeyboardManager'

    s.requires_arc = true

end