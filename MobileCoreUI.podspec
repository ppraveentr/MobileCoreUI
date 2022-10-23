Pod::Spec.new do |s|
  s.name             = 'MobileCoreUI'
  s.version          = '1.0.2'
  s.summary          = 'MobileCore is SwiftUI framework.'
  s.homepage         = 'https://github.com/ppraveentr/MobileCoreUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PraveenP' => 'ppraveentr@gmail.com' }
  s.source           = { :git => 'https://github.com/ppraveentr/MobileCoreUI.git', :tag => s.version.to_s }
  s.weak_framework 	 = 'UIKit'

  s.ios.deployment_target = '14.0'
  s.swift_version         = '5.5'
  s.default_subspecs      = 'Core', 'Theme'

  s.subspec 'Core' do |core|
    core.source_files  = 'Sources/CoreUtility/**/*.{h,m,swift}'
    core.header_dir    = "Core"
  end
  
  s.subspec 'Theme' do |theme|
    theme.source_files   = 'Sources/AppTheming/**/*.{h,m,swift}'
    theme.dependency  'MobileCore/Core'
    theme.header_dir    = "Theme"
  end
end
