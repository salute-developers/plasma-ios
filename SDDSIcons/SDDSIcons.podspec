Pod::Spec.new do |s|
s.name             = 'SDDSIcons'
s.version          = '0.1.0'
s.summary          = 'Salute design system. Assets library.'
s.homepage         = 'https://github.com/salute-developers/plasma-ios'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'username' => 'vkasci@gmail.com' }
s.source           = { :http => 'https://github.com/salute-developers/plasma-ios/releases/download/sdds-icons-v0.1.0/sdds-icons-0.1.0.zip'}
s.ios.deployment_target = '14.0'
s.vendored_frameworks = 'build/SDDSIcons.xcframework'
end
