Pod::Spec.new do |s|
s.name             = 'SDDSIcons'
s.version          = '1.0.0'
s.summary          = 'Salute design system. Assets library.'
s.description      = 'Salute design system. Assets library.'
s.homepage         = 'https://github.com/salute-developers/plasma-ios'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'username' => 'vkasci@gmail.com' }
s.platform         = :ios, "14.0"
s.source           = { :http => 'https://github.com/salute-developers/plasma-ios/releases/download/SDDSIcons-v1.0.0/SDDSIcons-v1.0.0.zip'}
s.ios.deployment_target = '14.0'
s.swift_version = '5.0'
s.vendored_frameworks = 'SDDSIcons.xcframework'
end
