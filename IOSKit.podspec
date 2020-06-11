Pod::Spec.new do |spec|

spec.name         = "IOSKit"
spec.version      = "1.2.0"
spec.summary      = "ios开发工具包"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
spec.description  = <<-DESC
对一些常用的操作进行封装
DESC
spec.homepage     = "https://github.com/da0ke/IOSKit"
spec.license      = "MIT"
spec.author             = { "da0ke" => "592052922@qq.com" }

spec.platform     = :ios, "8.0"
spec.swift_version = "5"
spec.source       = { :git => "https://github.com/da0ke/IOSKit.git", :tag => "#{spec.version}" }

spec.source_files  = "IOSKit/Source/**/*.swift"
spec.ios.resource_bundle = { 'IOSKit' => 'IOSKit/Source/IOSKit.xcassets' }

spec.dependency "Alamofire", "4.8.2"
spec.dependency "CryptoSwift", "1.0.0"

end
