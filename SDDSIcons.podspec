Pod::Spec.new do |s|
s.name             = 'SDDSIcons'
s.version          = '0.0.1'
s.summary          = 'Salute design system. Assets library.'
s.description      = 'Salute design system. Assets library.'
s.homepage         = 'https://github.com/salute-developers/plasma-ios'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'username' => 'vkasci@gmail.com' }
s.platform         = :ios, "14.0"
s.source           = { :http => 'https://github.com/salute-developers/plasma-ios/releases/download/0.0.1/SDDSIcons-v0.0.1.zip'}
s.ios.deployment_target = '14.0'
s.vendored_frameworks = 'SDDSIcons.xcframework'
end
