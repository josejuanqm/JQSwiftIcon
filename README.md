# JQSwiftIcon

[![Build Status](https://travis-ci.org/josejuanqm/JQSwiftIcon.svg?branch=master)](https://travis-ci.org/josejuanqm/JQSwiftIcon)
[![Version](https://img.shields.io/cocoapods/v/JQSwiftIcon.svg?style=flat)](http://cocoapods.org/pods/JQSwiftIcon)
[![License](https://img.shields.io/cocoapods/l/JQSwiftIcon.svg?style=flat)](http://cocoapods.org/pods/JQSwiftIcon)
[![Platform](https://img.shields.io/cocoapods/p/JQSwiftIcon.svg?style=flat)](http://cocoapods.org/pods/JQSwiftIcon)


<img src="https://raw.githubusercontent.com/josejuanqm/JQSwiftIcon/master/CS/ib.png" width="48%">
<img src="https://raw.githubusercontent.com/josejuanqm/JQSwiftIcon/master/CS/iphone.png" width="31%">

## Installation

JQSwiftIcon is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JQSwiftIcon"
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Cheat Sheets
First, check out the Cheat Sheets
####IMPORTANT: All clasess containing "_" or "-" have been replaced by "."

| Name | Prefix | Cheat Sheet |
|---|---|---|---|---|
| Material Icons | mat | [Link](https://design.google.com/icons/) |
| Font Awesome | fa | [Link](http://fontawesome.io/cheatsheet/) |
| Ion Icons | ii | [Link](http://ionicons.com) |
| Map Icons | mp | [Link](http://map-icons.com) |
| Octicons | oi | [Link](https://octicons.github.com) |
| Open Iconic | inic | [Link](https://useiconic.com/open/) |
| Themify | th | [Link](http://themify.me/themify-icons) |

## Placeholder Structure
> ###< Prefix >:< Icon Class >

##Usage

In your UILabel, UIButton or UITextField, set a text containing a placeholder anywhere you want the icon to be. Somethink like this

> fa:building

Then you can choose between 2 ways you can use JQSwiftIcon.
####1. No Custom Class

Simply import JQSwiftIcon and call processIcons on any UILabel, UIButton or UITextField that has a placeholder.

```swift
myLabel.processIcons()
```
####2. Custom Class

The lazy way, just set your UILabel, UIButton class as JQIconLabel or JQIconButton, and thats it, your icons will be processed at runtime.

## Author

Jose Quintero, jose.juan.qm@gmail.com

## License

JQSwiftIcon is available under the MIT license. See the LICENSE file for more info.
