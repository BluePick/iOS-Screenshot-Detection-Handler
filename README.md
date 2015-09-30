# iOS-Screenshot-Detection-Handler
Use to intercept when a user takes a screenshot and allow user to perform an action

# How To Use
1. Download `ScreenshotDetectionView.swift` and drag into project.
2. Initialize `ScreenshotDetectionView()` and add as a subview to a ViewController.
3. When a screenshot is taken, the method passed in as a selector in the ViewController class will be called. This can be set to repeat with the repeat: field in the initializer of `ScreenshotDetectionView()`

# Example
Initialize view and add as a subview
```swift
//place in view controller
let detectView = ScreenshotDetectionView(parent: self, title: "title", message: "this is a message", selector: Selector("screenshotHandler"), repeats: true)
        view.addSubview(detectView)
```
Create a method to handle response to "ok" of alert view
```swift
func screenshotHandler() {
    //gets called after user presses ok on alert
    //perform some function here
}
```

# Requirements
Build currently supports the following configuration
- Swift 2.0
- XCode 7.0
