#
# Be sure to run `pod lib lint DZAUnsafeMutableArray.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DZAUnsafeMutableArray'
  s.version          = '0.1.0'
  s.summary          = 'An Objective-C wrapper around a c auto-growing pointer array.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
I built this library because I'm rewriting [RouletteBetter](https://itunes.apple.com/us/app/roulettebetter-odds-calculator-betting-strategies-for/id310598685?mt=8) and I wanted a way to make *lot* of statistics calculation on vectors. To do so, we can use the [iOS Accelerate framework](https://developer.apple.com/documentation/accelerate) to 'Make large-scale mathematical computations and image calculations, optimized for high performance'. Unfortunately the Accelerate framework wants basic c pointer array as input/output parameters, so we can't use NSMutableArray or high level NSObjects.

With this wrapper library, we can easily create and manupulate the c pointer array as an high level object and, whenewer we need it, access the low level pointer property (for example to pass it to the Accelerate framework c functions).
                       DESC

  s.homepage         = 'https://github.com/Davide Di Stefano/DZAUnsafeMutableArray'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Davide Di Stefano' => 'dzamirro@gmail.com' }
  s.source           = { :git => 'https://github.com/Davide Di Stefano/DZAUnsafeMutableArray.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DZAUnsafeMutableArray/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DZAUnsafeMutableArray' => ['DZAUnsafeMutableArray/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
