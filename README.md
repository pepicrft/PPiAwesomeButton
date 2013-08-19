PPiAwesomeButton
================

UIButton category with new methods to setup a button with text + FontAwesome Icon.

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

## Screenshot
![image](http://img189.imageshack.us/img189/3955/07yh.gif)

