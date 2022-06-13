#
# Be sure to run `pod lib lint XYUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XYUIKit'
  s.version          = '0.0.2'
  s.summary          = 'You can easy to make UI, but you maybe take some parameters...'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: You can easy to make UI, but you maybe take some parameters... 你可以很容易地做UI，但你可能需要一些参数…
                       DESC

  s.homepage         = 'https://github.com/CoderXXY/XYUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'coderXY' => 'coderxxy@163.com' }
  s.source           = { :git => 'https://github.com/CoderXXY/XYUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'XYUIKit/Classes/*'
  s.requires_arc = true

  
  #s.resource_bundles = {
  #  'XYUIKit' => ['XYUIKit/Assets/*.png']
  #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
