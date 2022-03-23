Pod::Spec.new do |s|
  
  s.name            = "VhallAdidasSDK"
  s.module_name     = 'VhallAdidasSDK'
  s.summary         = "VhallAdidasSDK"
  s.module_name     = 'VhallAdidasSDK'

  s.version         = "1.6.2"
  s.license         = 'MIT'
  s.platform        = :ios, '9.0'
  s.requires_arc    = true
  s.frameworks      = 'Foundation'

  s.author          = { "gc" => "guochao751082551@163.com" }
  s.source          = { :git => "git@github.com:adidasjc/vhall-ios-sdk.git", :tag => s.version.to_s}
  s.homepage        = 'https://github.com/adidasjc/vhall-ios-sdk'
  
  s.vendored_frameworks = 'VHallAdidasSDK/VHallAdidasSDK.framework'
  s.pod_target_xcconfig = {
    'VALID_ARCHS' => 'x86_64 armv7 arm64'
  }

  s.dependency 'AFNetworking','4.0.1'
  s.dependency 'MBProgressHUD','1.2.0'
  s.dependency 'Masonry','1.1.0'
  s.dependency 'SDWebImage','5.12.1'
  s.dependency 'SDWebImageFLPlugin','0.5.0'
  s.dependency 'MJRefresh','3.7.2'
  s.dependency 'MJExtension','3.4.0'
  s.dependency 'DZNEmptyDataSet','1.8.1'
  s.dependency 'YYKit','1.0.9'
  s.dependency 'VHCore','2.2.2'
  s.dependency 'VHYun_IM','2.3.2'
  s.dependency 'VHYun_LSS','2.4.3'

end
