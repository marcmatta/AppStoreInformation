# AppStoreInformation

[![CI Status](https://img.shields.io/travis/marcmatta@gmail.com/AppStoreInformation.svg?style=flat)](https://travis-ci.org/marcmatta@gmail.com/AppStoreInformation)
[![Version](https://img.shields.io/cocoapods/v/AppStoreInformation.svg?style=flat)](https://cocoapods.org/pods/AppStoreInformation)
[![License](https://img.shields.io/cocoapods/l/AppStoreInformation.svg?style=flat)](https://cocoapods.org/pods/AppStoreInformation)
[![Platform](https://img.shields.io/cocoapods/p/AppStoreInformation.svg?style=flat)](https://cocoapods.org/pods/AppStoreInformation)

## Features

- [x] Release History

## Requirements

- iOS 8.0+

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `AppStoreInformation` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'AppStoreInformation'
```

## Usage example

```swift
import AppStoreInformation
AppStoreInformation.shared(appId: appId).get {[weak self] (result) in
// Save result (AppInformation object) and use it
}
```

## Contribute

To contribute to **AppStoreInformation**, check the ``LICENSE`` file for more info.

## Meta

Distributed under the MIT license. See ``LICENSE`` for more information.

[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
