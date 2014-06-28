PPiAwesomeButton
================

UIButton category with new methods to setup a button with text + FontAwesome Icon.
<a href="eightfit://workouts/123">Open App</a>


### Updates

##### 28 -June-2014 - Cocoapods version - 1.3.7
- Updated demo project that didn't work due to UIView+Autolayout category

##### 26-March-2014 - Cocoapods version - 1.3.7
Added the feature to set the icon passing an UIImageView
```objc
-(void)setIconImageView:(UIImageView *)iconImageView;
```
Fixed issue related with vertical size of subviews

##### 25-March-2014 - Cocoapods version - 1.3.7
Added the possibility to set the icon in UIImage format. The way to do that is just using the methods:
```objc
+(UIAwesomeButton*)buttonWithType:(UIButtonType)type text:(NSString *)text icon:(NSString *)icon attributes:(NSDictionary *)attributes andIconPosition:(IconPosition)position;
-(id)initWithFrame:(CGRect)frame text:(NSString *)text iconImage:(UIImage *)icon attributes:(NSDictionary *)attributes andIconPosition:(IconPosition)position;
```

## Features

* Background color can be setup dependending on the UIButton State thanks to its new method: ```-(void)setBackgroundColor:(UIColor*)color forUIControlState:(UIControlState)state;```
* UIButton can be initialized using following  ```+(UIButton*)buttonWithType:(UIButtonType)type text:(NSString*)text icon:(NSString*)icon textAttributes:(NSDictionary*)attributes andIconPosition:(IconPosition)position;```
```-(id)initWithFrame:(CGRect)frame text:(NSString*)text icon:(NSString*)icon textAttributes:(NSDictionary*)attributes andIconPosition:(IconPosition)position;``` where you can specify text/icon attributes using an NSDictionary ( you'll find more information in [Apple Documentation](http://developer.apple.com/library/ios/DOCUMENTATION/Cocoa/Reference/Foundation/Classes/NSAttributedString_Class/Reference/Reference.html). Moreover you can specify position of Icon inside UIButton thanks to parameter IconPosition (Left or Right ))
* Anytime you can change following properties of UIButton: 
**textAttributes-**```-(void)setTextAttributes:(NSDictionary*)attributes forUIControlState:(UIControlState)state;```
**backgroundColor-**```-(void)setBackgroundColor:(UIColor*)color forUIControlState:(UIControlState)state;```
**iconPosition-**```-(void)setIconPosition:(IconPosition)position;```
**buttonText-**```-(void)setButtonText:(NSString*)text;```
**buttonIcon-**```-(void)setButtonIcon:(NSString*)icon;```
**buttonRadius-**```-(void)setRadius:(CGFloat)radius;```

## Install
The easiest way to install PPiAwesomeButton is using CocoaPods:

1) Add the pod to podfile 
```
pod 'PPiAwesomeButton'
pod 'FontAwesome+iOS', :git => 'git@github.com:alexdrone/ios-fontawesome.git'
```

2) Refresh your project pods ```pod install```

3) Add awesome font to your Info.plists setting `UIAppFonts` entry as array and adding `FontAwesome.ttf` to this array.


## Example of using
Here is an example of using for generate an UIButton with Twitter design
```
UIButton *twitter1=[UIButton buttonWithType:UIButtonTypeCustom text:@"Twitter" icon:@"icon-twitter" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [twitter1 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [twitter1 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
twitter1.frame=CGRectMake(10, 10, 120, 44);
[twitter1 setRadius:5.0];
[self.view addSubview:twitter1];
```
![image](http://img850.imageshack.us/img850/7708/8s89.png)

Here another one for a Pinterest button
```
UIButton *pinterest2=[UIButton buttonWithType:UIButtonTypeCustom text:@"Pin it!" icon:@"icon-pinterest" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:32],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [pinterest2 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [pinterest2 setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];

    pinterest2.frame=CGRectMake(10, 270, 280, 50);
    [pinterest2 setRadius:0.0];
    [self.view addSubview:pinterest2];
```
![image](http://img837.imageshack.us/img837/2633/xe8x.png)

And for Facetime too:
```
UIButton *facetime1=[UIButton buttonWithType:UIButtonTypeCustom text:@"Facetime" icon:@"icon-facetime-video" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionRight];
    [facetime1 setBackgroundColor:[UIColor colorWithRed:40.0f/255 green:219.0f/255 blue:31.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    facetime1.frame=CGRectMake(10, 160, 120, 44);
    [facetime1 setRadius:22.0];
    [self.view addSubview:facetime1];
```
![image](http://img266.imageshack.us/img266/3530/4wb.png)
### --- Extra - UIAwesomeButton ---
If you've detected some misalignments in icon and text I've created a new class called **UIAwesomeButton** (_UIView subclass_) that has the same behaviour an UIButton has but implemented from zero ( and without misalignments between elements ). Here's an example of implementation into your project:

```objective-c
UIAwesomeButton *button4 = [[UIAwesomeButton alloc] initWithFrame:CGRectMake(10, 400, 280, 50) text:@"Test" icon:nil textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor],@"IconFont":[UIFont fontWithName:@"fontawesome" size:40]} andIconPosition:IconPositionLeft];
    [button4 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [button4 setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    [button4 setRadius:3.0];
    [button4 setSeparation:10];
    [button4 setTextAlignment:NSTextAlignmentLeft];
    [button4 setActionBlock:^{
        NSLog(@"Working!");
    }];
    [self.view addSubview:button4];
```
## Screenshot
![image](http://img189.imageshack.us/img189/3955/07yh.gif)

## Attributed Strings : Attributes List

Attributes that you can apply to text in an attributed string.
```
NSString *const NSFontAttributeName;
NSString *const NSParagraphStyleAttributeName;
NSString *const NSForegroundColorAttributeName;
NSString *const NSBackgroundColorAttributeName;
NSString *const NSLigatureAttributeName;
NSString *const NSKernAttributeName;
NSString *const NSStrikethroughStyleAttributeName;
NSString *const NSUnderlineStyleAttributeName;
NSString *const NSStrokeColorAttributeName;
NSString *const NSStrokeWidthAttributeName;
NSString *const NSShadowAttributeName;
NSString *const NSVerticalGlyphFormAttributeName;
```
Full list [here](https://developer.apple.com/library/ios/documentation/uikit/reference/NSAttributedString_UIKit_Additions/Reference/Reference.html)

## Font Awesome Icons
![image](http://img819.imageshack.us/img819/7605/nw0b.png)

You'll find the list of Awesome Icons [here](http://fortawesome.github.io/Font-Awesome/icons/). Each icon has an identifier that you have to use in UIButton to add an Icon to your UIButton.

