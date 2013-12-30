//
//  ViewController.m
//  PPiAwesomeButton-Demo
//
//  Created by Pedro Piñera Buendía on 19/08/13.
//  Copyright (c) 2013 PPinera. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+PPiAwesome.h"
#import "UIAwesomeButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *twitter1=[UIButton buttonWithType:UIButtonTypeCustom text:@"Twitter" icon:@"icon-twitter" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor],@"IconFont":[UIFont fontWithName:@"fontawesome" size:50]} andIconPosition:IconPositionLeft];
    [twitter1 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [twitter1 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];

    twitter1.frame=CGRectMake(10, 10, 120, 44);
    [twitter1 setRadius:5.0];
    [self.view addSubview:twitter1];

    
    UIButton *twitter2=[UIButton buttonWithType:UIButtonTypeCustom text:@"Twitter" icon:@"icon-twitter" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [twitter2 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [twitter2 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];

    twitter2.frame=CGRectMake(10, 60, 120, 44);
    [twitter2 setRadius:5.0];
    [self.view addSubview:twitter2];
    
    UIButton *twitter3=[UIButton buttonWithType:UIButtonTypeCustom text:@"Twitter" icon:@"icon-twitter" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [twitter3 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [twitter3 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];

    twitter3.frame=CGRectMake(10, 110, 120, 44);
    [twitter3 setRadius:5.0];
    [self.view addSubview:twitter3];
    
    UIButton *face1=[UIButton buttonWithType:UIButtonTypeCustom text:@"Facebook" icon:@"icon-facebook" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    face1.frame=CGRectMake(140, 10, 140, 44);
    [face1 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    [face1 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [face1 setRadius:0.0];
    [self.view addSubview:face1];
    
    UIButton *face2=[UIButton buttonWithType:UIButtonTypeCustom text:@"Facebook" icon:@"icon-facebook" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    face2.frame=CGRectMake(140, 60, 140, 44);
    [face2 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    [face2 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];    [face2 setRadius:0.0];
    [self.view addSubview:face2];

    
    UIButton *face3=[UIButton buttonWithType:UIButtonTypeCustom text:@"Facebook" icon:@"icon-facebook" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    face3.frame=CGRectMake(140, 110, 140, 44);
    [face3 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    [face3 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];    [face3 setRadius:0.0];
    [self.view addSubview:face3];
    
    UIButton *facetime1=[UIButton buttonWithType:UIButtonTypeCustom text:@"Facetime" icon:@"icon-facetime-video" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionRight];
    [facetime1 setBackgroundColor:[UIColor colorWithRed:40.0f/255 green:219.0f/255 blue:31.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    facetime1.frame=CGRectMake(10, 160, 120, 44);
    [facetime1 setRadius:22.0];
    [self.view addSubview:facetime1];
    
    UIButton *facetime2=[UIButton buttonWithType:UIButtonTypeCustom text:@"" icon:@"icon-facetime-video" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionRight];
    [facetime2 setBackgroundColor:[UIColor colorWithRed:40.0f/255 green:219.0f/255 blue:31.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    facetime2.frame=CGRectMake(140, 160, 44, 44);
    [facetime2 setRadius:22.0];
    [self.view addSubview:facetime2];
    
    UIButton *pinterest1=[UIButton buttonWithType:UIButtonTypeCustom text:@"Pin it!" icon:@"icon-html5" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:32],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [pinterest1 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    pinterest1.frame=CGRectMake(10, 210, 150, 50);
    [pinterest1 setRadius:0.0];
    [self.view addSubview:pinterest1];
    
    UIButton *pinterest2=[UIButton buttonWithType:UIButtonTypeCustom text:@"Pin it!" icon:@"icon-pinterest" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:32],NSForegroundColorAttributeName:[UIColor whiteColor],@"IconFont":[UIFont fontWithName:@"fontawesome" size:20]} andIconPosition:IconPositionLeft];
    [pinterest2 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [pinterest2 setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];

    pinterest2.frame=CGRectMake(10, 270, 280, 50);
    [pinterest2 setRadius:0.0];
    [self.view addSubview:pinterest2];
    
    UIButton *pinterest3=[UIButton buttonWithType:UIButtonTypeCustom text:@"Pin it!" icon:@"icon-pinterest" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:32],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [pinterest3 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [pinterest3 setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    pinterest3.frame=CGRectMake(10, 330, 280, 50);
    [pinterest3 setRadius:0.0];
    [pinterest3 setSeparation:10];
    [self.view addSubview:pinterest3];
    
    UIAwesomeButton *button4 = [[UIAwesomeButton alloc] initWithFrame:CGRectMake(10, 400, 280, 50) text:@"Test" icon:nil textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor],@"IconFont":[UIFont fontWithName:@"fontawesome" size:40]} andIconPosition:IconPositionLeft];
    [button4 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [button4 setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    [button4 setRadius:3.0];
    [button4 setIcon:@"icon-pinterest"];
    [button4 setSeparation:10];
    [button4 setActionBlock:^{
        NSLog(@"Working!");
    }];
    [button4 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:button4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)buttonAction{
    NSLog(@"Press button");
}

@end
