Pod::Spec.new do |s|
  s.name     = 'KeKeKit'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'A delightful iOS and OS X networking framework.'
  s.homepage = 'https://github.com/ChenZhike/KeKeKit'
  s.source   = { :git => 'https://github.com/ChenZhike/KeKeKit.git', :tag => s.version, :submodules => true }
  s.public_header_files = 'KeKeKit/KeKeKit.h'
  s.source_files = 'KeKeKit/category/*.{h,m}'
  s.social_media_url = 'https://github.com/ChenZhike/KeKeKit'
  s.authors  = { 'KeKe' => 'a62396@126.com' }
  s.requires_arc = true
  
  pch_KeKeKit = <<-EOS
#ifndef TARGET_OS_IOS
  #define TARGET_OS_IOS TARGET_OS_IPHONE
#endif

#ifndef TARGET_OS_WATCH
  #define TARGET_OS_WATCH 0
#endif

#ifndef TARGET_OS_TV
  #define TARGET_OS_TV 0
#endif
EOS
  s.prefix_header_contents = pch_KeKeKit
  
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
end
