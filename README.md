# TechAssesment
Build a simple app to hit the NY Times Most Popular Articles API and show a list of articles, that shows details when items on the list are tapped (a typical master/detail app).

## Reqirements

- iOS 12.0+ / macOS
- Xcode
- Swift 5+

## Installing 

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate TechAssesment into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
# Pods for BoubyanTechAssesment
  # Kingfisher to lazy load images
  pod 'Kingfisher', '~> 7.1.2'
  # Alamofire to make requests
  pod 'Alamofire'
  # SwiftMessages to dispaly notifications for users inside app
  pod 'SwiftMessages', '~> 9.0.5'
  # Moya to create and manage api providers
  pod 'Moya'
  # NVActivityIndicatorView to add wesome indicators
  pod 'NVActivityIndicatorView'
```

## TestCases

-> test if called api without errors
-> test if count of articles equal to 20