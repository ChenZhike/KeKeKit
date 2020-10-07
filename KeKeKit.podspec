Pod::Spec.new do |s|
    s.name         = "KeKeKit"
    s.version      = "0.0.2"
    s.ios.deployment_target = '10.0'
    s.summary      = "'A delightful iOS common framework."
    s.homepage     = "https://github.com/ChenZhike/KeKeKit"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { 'KeKe' => 'a62396@126.com' }
    s.social_media_url   = "https://github.com/ChenZhike/KeKeKit"
    s.source       = { :git => "https://github.com/ChenZhike/KeKeKit.git", :tag => s.version }
    s.source_files  = KeKeKit/core/*.{h,m}"
    s.requires_arc = true
end