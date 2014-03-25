//
//  UIAwesomeButton.m
//  PPiAwesomeButton-Demo
//
//  Created by Pedro Piñera Buendia on 30/12/13.
//  Copyright (c) 2013 PPinera. All rights reserved.
//

#import "UIAwesomeButton.h"
#import "UIView+AutoLayout.h"
@interface UIAwesomeButton ()
@property (nonatomic,strong) NSMutableDictionary *backgroundColors;
@property (nonatomic,strong) NSMutableDictionary *attributes;
@property (nonatomic,strong) UILabel *iconLabel, *textLabel;
@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic) UIControlState controlState;
@property (nonatomic) CGFloat separation;
@property (nonatomic,strong) NSString *buttonText;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) UIImage *iconImage;
@property (nonatomic) NSTextAlignment textAligment;
@property (nonatomic,strong) NSNumber *horizontalmargin;
@end

@implementation UIAwesomeButton
+(UIAwesomeButton*)buttonWithType:(UIButtonType)type text:(NSString *)text iconImage:(UIImage *)icon attributes:(NSDictionary *)attributes andIconPosition:(IconPosition)position
{
    UIAwesomeButton *button = [[UIAwesomeButton alloc] initWithFrame:CGRectZero text:text iconImage:icon attributes:attributes andIconPosition:position];
    return button;
}

+(UIAwesomeButton*)buttonWithType:(UIButtonType)type text:(NSString *)text icon:(NSString *)icon attributes:(NSDictionary *)attributes andIconPosition:(IconPosition)position
{
    UIAwesomeButton *button = [[UIAwesomeButton alloc] initWithFrame:CGRectZero text:text icon:icon attributes:attributes andIconPosition:position];
    return button;
}
-(id)initWithFrame:(CGRect)frame text:(NSString *)text icon:(NSString *)icon attributes:(NSDictionary *)attributes andIconPosition:(IconPosition)position{
    self=[super initWithFrame:frame];
    if(self){
        [self setIcon:icon andButtonText:text];
        [self setAttributes:attributes forUIControlState:UIControlStateNormal];
        [self setIconPosition:position];
        [self setTextAlignment:NSTextAlignmentCenter];
        [self setControlState:UIControlStateNormal];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame text:(NSString *)text iconImage:(UIImage *)icon attributes:(NSDictionary *)attributes andIconPosition:(IconPosition)position
{
    self=[super initWithFrame:frame];
    if(self){
        [self setIconImage:icon andButtonText:text];
        [self setAttributes:attributes forUIControlState:UIControlStateNormal];
        [self setIconPosition:position];
        [self setTextAlignment:NSTextAlignmentCenter];
        [self setControlState:UIControlStateNormal];
    }
    return self;
}

-(void)updateButtonContent{
    // Removing from superView
    [self.textLabel removeFromSuperview];
    [self.iconLabel removeFromSuperview];
    [self.iconImageView removeFromSuperview];

    //Setting labels
    [self updateSubviewsContent];

    // Horizontal layout
    [self addSubview:self.textLabel];
    if(self.icon)[self addSubview:self.iconLabel];
    if(self.iconImage)[self addSubview:self.iconImageView];


    // Elements order ICON/TEXT
    UIView *iconElement = self.icon? self.iconLabel : self.iconImageView;
    UIView *element1 = iconElement;
    UIView *element2 = self.textLabel;
    if(self.iconPosition == IconPositionRight){
        element1 = self.textLabel;
        element2 = iconElement;
    }
    float horizontalMargin = [[self horizontalmargin] floatValue];
    float margin  = self.frame.size.height*0.10;
    if([element1 isKindOfClass:[UILabel class]])
    {
        [(UILabel*)element1 setTextAlignment:NSTextAlignmentLeft];
    }
    if([element2 isKindOfClass:[UILabel class]])
    {
        [(UILabel*)element2 setTextAlignment:NSTextAlignmentLeft];
    }
    if(self.textAligment == NSTextAlignmentLeft){
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(horizontalMargin)-[element1]-separation-[element2]" options:NSLayoutFormatAlignAllCenterY metrics:@{@"separation":@(self.separation),@"horizontalMargin":@(horizontalMargin)} views:@{@"element1":element1,@"element2":element2}]];
    }
    else if (self.textAligment == NSTextAlignmentRight)
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[element1]-separation-[element2]-(horizontalMargin)-|" options:NSLayoutFormatAlignAllCenterY metrics:@{@"separation":@(self.separation),@"horizontalMargin":@(horizontalMargin)} views:@{@"element1":element1,@"element2":element2}]];
    else{
//        NSArray *views = @[element1,element2];
//        NSArray *constraints = [views autoDistributeViewsAlongAxis:ALAxisHorizontal withFixedSpacing:self.separation alignment:NSLayoutFormatAlignAllCenterY];
//        [self addConstraints:constraints];
        CGFloat element1Width = 0;
        CGFloat element2Width = 0;
        if([element1 isKindOfClass:[UILabel class]])
        {
            [(UILabel*)element1 setTextAlignment:NSTextAlignmentRight];
           element1Width = [((UILabel*)element1).text sizeWithFont:((UILabel*)element1).font].width;
        }
        else if([element1 isKindOfClass:[UIImageView class]])
        {
            [(UIImageView*)element1 setContentMode:UIViewContentModeRight];
            element1Width = [(UIImageView *) element1 image].size.width;
        }
        if([element2 isKindOfClass:[UILabel class]])
        {
            [(UILabel*)element2 setTextAlignment:NSTextAlignmentLeft];
            element2Width = [((UILabel*)element2).text sizeWithFont:((UILabel*)element2).font].width;

        }
        else if([element2 isKindOfClass:[UIImageView class]])
        {
            [(UIImageView*)element2 setContentMode:UIViewContentModeLeft];
            element2Width = [(UIImageView *) element2 image].size.width;
        }

        CGFloat originX = (self.frame.size.width - (element1Width+self.separation+element2Width))/2;
        [element1 setFrame:CGRectMake(originX, element1.frame.origin.y, element1Width, element1.frame.size.height)];
        [element2 setFrame:CGRectMake(originX + element1Width + self.separation, element2.frame.origin.y, element2Width, element2.frame.size.height)];
    }
    // Vertical layout
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[item]-margin-|" options:NSLayoutFormatAlignAllCenterY metrics:@{@"margin":@(margin)} views:@{@"item":element1}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[item]-margin-|" options:NSLayoutFormatAlignAllCenterY metrics:@{@"margin":@(margin)} views:@{@"item":element2}]];


    [self.iconLabel needsUpdateConstraints];
    [self.textLabel needsUpdateConstraints];
}

-(void)updateButtonFormat{
    // Setting background color
    [self setBackgroundColor:[self backgroundColorForState:self.controlState]];

    //Setting labels
    [self updateSubviewsContent];
}
-(void)updateSubviewsContent
{
    // Setting the constraints
    if(self.buttonText){
        [self.textLabel setAttributedText:[[NSAttributedString alloc] initWithString:self.buttonText attributes:[self textAttributesForState:self.controlState]]];
        [self.textLabel setBackgroundColor:[UIColor clearColor]];
    }else{
        [self.textLabel setText:@""];
    }
    if(self.icon){
        [self.iconLabel setAttributedText:[[NSAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForIconIdentifier:self.icon] attributes:[self iconAttributesForState:self.controlState]]];
        [self.iconLabel setBackgroundColor:[UIColor clearColor]];
    }else{
        [self.iconLabel setText:@""];
    }

    [self.iconImageView setImage:self.iconImage];
}
#pragma mark -
#pragma mark Touches

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesBegan:touches withEvent:event];
    [self setControlState:UIControlStateHighlighted];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesCancelled:touches withEvent:event];
    [self setControlState:UIControlStateNormal];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    //if([self isAwesome])
    [self setControlState:UIControlStateNormal];
    if(self.actionBlock){
        self.actionBlock();
    }
}


#pragma mark -
#pragma mark - Lazy Instantiation
-(NSMutableDictionary*)attributes{
    if(!_attributes) _attributes = [NSMutableDictionary new];
    return _attributes;
}
-(NSMutableDictionary*)backgroundColors{
    if(!_backgroundColors) _backgroundColors = [NSMutableDictionary new];
    return _backgroundColors;
}
-(UILabel*)textLabel{
    if(!_textLabel){
        _textLabel = [UILabel new];
        [_textLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_textLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_textLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _textLabel;
}
-(UILabel*)iconLabel{
    if(!_iconLabel){
        _iconLabel = [UILabel new];
        [_iconLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_iconLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_iconLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _iconLabel;
}

-(UIImageView*)iconImageView
{
    if(!_iconImageView){
        _iconImageView = [UIImageView new];
        [_iconImageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_iconImageView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_iconImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_iconImageView setContentMode:UIViewContentModeCenter];
    }
    return _iconImageView;
}

#pragma mark - Custom getters
-(NSDictionary*)iconAttributesForState:(UIControlState)state{
    NSMutableDictionary *iconAttributes = [[self textAttributesForState:state] mutableCopy];
    if ([iconAttributes objectForKey:@"IconFont"]) {
        iconAttributes[NSFontAttributeName] = iconAttributes[@"IconFont"];
    }else{
        UIFont *textFont = ((UIFont*)iconAttributes[NSFontAttributeName]);
        iconAttributes[NSFontAttributeName]=[UIFont fontWithName:@"fontawesome" size:textFont.pointSize];
    }
    return iconAttributes;
}
-(NSDictionary*)textAttributesForState:(UIControlState)state{
    if(self.attributes[@(state)]) return self.attributes[@(state)];
    else return self.attributes[@(UIControlStateNormal)];
}
-(UIColor*)backgroundColorForState:(UIControlState)state{
    if(self.backgroundColors[@(state)]) return self.backgroundColors[@(state)];
    else return self.backgroundColors[@(UIControlStateNormal)];

}
-(NSNumber*)horizontalmargin{
    if(!_horizontalmargin) _horizontalmargin = @(20);
    return _horizontalmargin;
}
#pragma  mark - Setters
-(void)setHorizontalMargin:(CGFloat)margin{
    _horizontalmargin = @(margin);
    [self updateButtonContent];
}
-(void)setTextAlignment:(NSTextAlignment)alignment{
    _textAligment=alignment;
    [self updateButtonContent];
}
-(void)setRadius:(CGFloat)radius{
    self.layer.cornerRadius=radius;
}

-(void)setSeparation:(CGFloat)separation{
    _separation = separation;
    [self updateButtonContent];
}
-(void)setAttributes:(NSDictionary*)attributes forUIControlState:(UIControlState)state{
    //Setting attributes
    self.attributes[@(state)]=attributes;
    [self updateButtonFormat];
}

-(void)setBackgroundColor:(UIColor*)color forUIControlState:(UIControlState)state{
    self.backgroundColors[@(state)]=color;
    [self updateButtonFormat];
}
-(void)setControlState:(UIControlState)controlState{
    _controlState = controlState;
    [self updateButtonFormat];
}
-(void)setIcon:(NSString *)icon andButtonText:(NSString*)text{
    _buttonText = text;
    _icon = icon;
    _iconImage = nil;
    [self updateButtonContent];
}
-(void)setIconImage:(UIImage *)iconImage andButtonText:(NSString*)text{
    _buttonText = text;
    _iconImage = iconImage;
    _icon = nil;
    [self updateButtonContent];
}
-(void)setButtonText:(NSString *)buttonText{
    _buttonText = buttonText;
    [self updateButtonContent];
}

-(void)setIconImage:(UIImage *)icon{
    _icon = nil;
    _iconImage = icon;
    [self updateButtonContent];
}
-(void)setIcon:(NSString *)icon{
    _icon = icon;
    _iconImage = nil;
    [self updateButtonContent];
}
-(void)setIconPosition:(IconPosition)iconPosition{
    _iconPosition = iconPosition;

}

@end
