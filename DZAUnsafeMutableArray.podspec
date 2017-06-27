Pod::Spec.new do |s|
  s.name             = 'DZAUnsafeMutableArray'
  s.version          = '0.2.1'
  s.summary          = 'An Objective-C wrapper around a c auto-growing pointer array.'

  s.description      = <<-DESC
I built this library because I'm rewriting [RouletteBetter](https://itunes.apple.com/us/app/roulettebetter-odds-calculator-betting-strategies-for/id310598685?mt=8) and I wanted a way to make *lot* of statistics calculation on vectors. To do so, we can use the [iOS Accelerate framework](https://developer.apple.com/documentation/accelerate) to 'Make large-scale mathematical computations and image calculations, optimized for high performance'. Unfortunately the Accelerate framework wants basic c pointer array as input/output parameters, so we can't use NSMutableArray or high level NSObjects.

With this wrapper library, we can easily create and manupulate the c pointer array as an high level object and, whenewer we need it, access the low level pointer property (for example to pass it to the Accelerate framework c functions).
                       DESC

  s.homepage         = 'https://github.com/Dzamir/DZAUnsafeMutableArray'
  s.screenshots     = 'https://raw.githubusercontent.com/Dzamir/DZAUnsafeMutableArray/master/screen_2.jpg', 'https://raw.githubusercontent.com/Dzamir/DZAUnsafeMutableArray/master/screen_1.jpg'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Davide Di Stefano' => 'dzamirro@gmail.com' }
  s.source           = { :git => 'https://github.com/Dzamir/DZAUnsafeMutableArray.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dzamir'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target  = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'DZAUnsafeMutableArray/Classes/**/*'
end
