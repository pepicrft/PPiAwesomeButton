//
//  UIAwesomeButton.h
//  PPiAwesomeButton-Demo
//
//  Created by Pedro Piñera Buendia on 30/12/13.
//  Copyright (c) 2013 PPinera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+FontAwesome.h"
#import "UIButton+PPiAwesome.h"

typedef void (^block)();
@interface UIAwesomeButton : UIView

@property (nonatomic) IconPosition iconPosition;
@property (nonatomic,strong) NSDictionary *textAttributes;
@property (nonatomic,copy)void (^actionBlock)();

// Initializers
+(UIAwesomeButton*)buttonWithType:(UIButtonType)type text:(NSString*)text icon:(NSString*)icon textAttributes:(NSDictionary*)attributes andIconPosition:(IconPosition)position;
-(id)initWithFrame:(CGRect)frame text:(NSString*)text icon:(NSString*)icon textAttributes:(NSDictionary*)attributes andIconPosition:(IconPosition)position;

// Setters
-(void)setButtonText:(NSString *)buttonText;
-(void)setIcon:(NSString *)icon;
-(void)setAttributes:(NSDictionary*)attributes forUIControlState:(UIControlState)state;
-(void)setBackgroundColor:(UIColor*)color forUIControlState:(UIControlState)state;
-(void)setRadius:(CGFloat)radius;
-(void)setControlState:(UIControlState)controlState;
-(void)setSeparation:(CGFloat)separation;
-(void)setTextAlignment:(NSTextAlignment)alignment;
-(void)setHorizontalMargin:(CGFloat)margin;
;
@end
