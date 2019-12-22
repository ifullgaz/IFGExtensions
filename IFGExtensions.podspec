#
# Be sure to run `pod lib lint IFGExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IFGExtensions'
  s.version          = '0.1.2'
  s.summary          = 'A collection of handy extensions'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A collection of handy extensions, mainly from my experience at work
                       DESC

  s.homepage         = 'https://github.com/ifullgaz/IFGExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Emmanuel Merali' => 'emmanuel@merali.me' }
  s.source           = { :git => 'https://github.com/ifullgaz/IFGExtensions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.swift_versions        = ['5.0', '5.1']

  s.source_files = 'IFGExtensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'IFGExtensions' => ['IFGExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
