# SHProgressView
SHProgressView is an animated progress view for iOS written in swift.

A sample project demonstrates the usage of SHProgressView Class to implement progress view easily.

[![Swift 4.0](https://img.shields.io/badge/Swift-4-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)]()

<img src="/Screenshots/SHProgressView.png" /> 

## Installation
Just drag and drop the SHProgressView folder to your project.
#### Cocoapods - updating soon

## Usage

1. Just drag and drop an Table View in storyboard and set Table View class to SHSelections and set an outlet.

<img src="/Screenshots/SS1.png" /> 
 
2. How to configure:
#### Example Code
```swift 
    @IBOutlet weak var progressTV: SHProgressView!
```
- Customise Progress view : 

-- Progress cirle active & inactive color
```swift 
progressTV.cricleActiveColor = UIColor(red: 0.0/255.0, green: 204.0/255.0, blue: 201.0/255.0, alpha: 1.0)
progressTV.cricleInactiveColor = UIColor.gray
```
-- Progress line active & inactive color
```swift 
progressTV.lineActiveColor = UIColor(red: 0.0/255.0, green: 204.0/255.0, blue: 201.0/255.0, alpha: 1.0)
progressTV.lineInactiveColor = UIColor.gray  
```

-- Text active & inactive color
```swift 
progressTV.textActiveColor = UIColor.darkGray
progressTV.textInactiveColor = UIColor.gray        
```
- Set data to progress view : 

```swift 
progressTV.items = ["Set list of items here"] //An array of string
```
#### Note: Set data to progress view after customising

## Requirements

* iOS 10.0+

## Example

Download the Sample project.

## Contact

Mail me @: shezadahamed95@gmail.com
