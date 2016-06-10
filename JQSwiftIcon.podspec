#
# Be sure to run `pod lib lint JQSwiftIcon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JQSwiftIcon'
  s.version          = '0.1.0'
  s.summary          = 'String interpolation made for icon fonts.'

  s.description      = <<-DESC
Easily implement Icon Fonts with iOS projects, using String interpolation JQSwiftIcon replaces arguments with real icons.
                       DESC

  s.homepage         = 'https://github.com/josejuanqm/JQSwiftIcon'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jose Quintero' => 'jose.juan.qm@gmail.com' }
  s.source           = { :git => 'https://github.com/josejuanqm/JQSwiftIcon.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/josejuanqm'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JQSwiftIcon/Classes/**/*'
  
  s.resource_bundles = {
    'JQSwiftIcon' => ['JQSwiftIcon/Classes/Resources/*.ttf']
  }
end
