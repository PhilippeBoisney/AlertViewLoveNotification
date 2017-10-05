<p align="center">
 <img src ="https://raw.githubusercontent.com/PhilippeBoisney/AlertViewLoveNotification/master/bandeau.png", align="center"/>
</p>
A simple and attractive AlertView **to ask permission to your users for Push Notification.**

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)

## PRESENTATION

<p>Ask permission to user for push notification is really important. But the native alertview is so ugly and often means SPAM for user..<br>
With AlertViewLoveNotification, asking permission for push notification <b>becomes easy and beautiful.</b><br>
So try it !
</p>

## DEMO
<p align="center">
 <img src ="https://raw.githubusercontent.com/PhilippeBoisney/AlertViewLoveNotification/master/demo.gif", width=480, height=320, align="left"/>
 <img src ="https://raw.githubusercontent.com/PhilippeBoisney/AlertViewLoveNotification/master/screenshot.png", height=320/>
</p>

## INSTALLATION

####CocoaPods
```
pod 'AlertViewLoveNotification'
```

#### Manually
1. Download and drop ```AlertViewLoveNotification.swift``` in your project.  
2. Congratulations! 

## USAGE
```swift

//Simply call AlertViewLoveNotification...
 var alertView = AlertViewLoveNotification(imageName: "iconNotification", labelTitle: "ENABLE PUSH NOTIFICATIONS", labelDescription: "Would you like to be alerted about us, at any moment, even when you're sleeping ? Because we miss you... Always.", buttonYESTitle: "Yes, Of course !", buttonNOTitle: "No, sorry.")

//... and show it !
alertView.show()

//And maybe, if you want, you can hide it.
alertView.hide()

```
**CUSTOMIZING**

You have to set options **BEFORE** call show() function.

```swift
///Height of each view (Total of this height MUST be equal to 1)
self.alertView.heightOfButtonYes = 0.1
self.alertView.heightOfButtonNo = 0.1
self.alertView.heightSpaceBetweenViews = 0.05 ///There is 4 spaces
self.alertView.heightOfContenerForImage = 0.35
self.alertView.heightOfTitle = 0.1
self.alertView.heightOfDescription = 0.15

///Width of each view
self.alertView.widthOfImage = 0.9
self.alertView.widthOfTitle = 0.7
self.alertView.widthOfDescription = 0.9
self.alertView.widthForButtons = 0.8

self.alertView.heightOfImage = 0.7

///Colors of views
self.alertView.colorLabelTitle = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
self.alertView.colorLabelDescription = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)

self.alertView.colorBackgroundAlertView = UIColor.redColor()

self.alertView.colorBacgroundButtonYes = UIColor(red:0.96, green:0.56, blue:0.46, alpha:1.0)
self.alertView.colorTextColorButtonYes = UIColor.whiteColor()

self.alertView.colorBacgroundButtonNO = UIColor.clearColor()
self.alertView.colorTextColorButtonNO = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)

```

## FEATURES
- [x] Multi-Device Full Support
- [x] Rotation Support
- [x] Fully customizable

## Version
1.4

## Author
Philippe BOISNEY (phil.boisney(@)gmail.com)
