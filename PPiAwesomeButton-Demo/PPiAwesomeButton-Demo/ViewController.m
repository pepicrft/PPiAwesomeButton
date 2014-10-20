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
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.button1 setIsAwesome:YES];
    [self.button1 setButtonText:@"Twitter"];
    [self.button1 setButtonIcon:@"icon-twitter"];
    [self.button1 setIconPosition:IconPositionLeft];
    [self.button1 setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],
                                      NSForegroundColorAttributeName:[UIColor whiteColor],
                                      @"IconFont":[UIFont fontWithName:@"fontawesome" size:50]}
                  forUIControlState:UIControlStateNormal];
    [self.button1 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateNormal];
    [self.button1 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateHighlighted];
    [self.button1 setRadius:5.0];

    
    [self.button2 setIsAwesome:YES];
    [self.button2 setButtonText:@"Twitter"];
    [self.button2 setButtonIcon:@"icon-twitter"];
    [self.button2 setIconPosition:IconPositionLeft];
    [self.button2 setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                      NSForegroundColorAttributeName:[UIColor whiteColor]}
                  forUIControlState:UIControlStateNormal];
    [self.button2 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateNormal];
    [self.button2 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateHighlighted];
    [self.button2 setRadius:5.0];

    
    [self.button3 setIsAwesome:YES];
    [self.button3 setButtonText:@"Twitter"];
    [self.button3 setButtonIcon:@"icon-twitter"];
    [self.button3 setIconPosition:IconPositionLeft];
    [self.button3 setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],
                                      NSForegroundColorAttributeName:[UIColor whiteColor]}
                  forUIControlState:UIControlStateNormal];
    [self.button3 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateNormal];
    [self.button3 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateHighlighted];
    [self.button3 setRadius:5.0];

    
    [self.button4 setIsAwesome:YES];
    [self.button4 setButtonText:@"Facebook"];
    [self.button4 setButtonIcon:@"icon-facebook"];
    [self.button4 setIconPosition:IconPositionLeft];
    [self.button4 setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],
                                      NSForegroundColorAttributeName:[UIColor whiteColor]}
                  forUIControlState:UIControlStateNormal];
    [self.button4 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateHighlighted];
    [self.button4 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateNormal];
    [self.button4 setRadius:0.0];


    [self.button5 setIsAwesome:YES];
    [self.button5 setButtonText:@"Facebook"];
    [self.button5 setButtonIcon:@"icon-facebook"];
    [self.button5 setIconPosition:IconPositionLeft];
    [self.button5 setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                      NSForegroundColorAttributeName:[UIColor whiteColor]}
                  forUIControlState:UIControlStateNormal];
    [self.button5 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateHighlighted];
    [self.button5 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateNormal];
    [self.button5 setRadius:0.0];

    
    [self.button6 setIsAwesome:YES];
    [self.button6 setButtonText:@"Facebook"];
    [self.button6 setButtonIcon:@"icon-facebook"];
    [self.button6 setIconPosition:IconPositionLeft];
    [self.button6 setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],
                                      NSForegroundColorAttributeName:[UIColor whiteColor]}
                  forUIControlState:UIControlStateNormal];
    [self.button6 setBackgroundColor:[UIColor colorWithRed:27.0f/255 green:178.0f/255 blue:233.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateHighlighted];
    [self.button6 setBackgroundColor:[UIColor colorWithRed:60.0f/255 green:89.0f/255 blue:157.0f/255 alpha:1.0]
                   forUIControlState:UIControlStateNormal];
    [self.button6 setRadius:0.0];

    UIButton *facetime1=[UIButton buttonWithType:UIButtonTypeCustom text:@"Facetime" icon:@"icon-facetime-video" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionRight];
    [facetime1 setBackgroundColor:[UIColor colorWithRed:40.0f/255 green:219.0f/255 blue:31.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    facetime1.frame=CGRectMake(10, 200, 120, 44);
    [facetime1 setRadius:22.0];
    [facetime1 setEnabled:NO];
    [self.view addSubview:facetime1];

    UIButton *facetime2=[UIButton buttonWithType:UIButtonTypeCustom text:@"" icon:@"icon-facetime-video" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionRight];
    [facetime2 setBackgroundColor:[UIColor colorWithRed:40.0f/255 green:219.0f/255 blue:31.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    facetime2.frame=CGRectMake(140, 200, 44, 44);
    [facetime2 setRadius:22.0];
    [facetime2 setBorderWidth:2.f
                  borderColor:[UIColor lightGrayColor]];
    [self.view addSubview:facetime2];

    UIButton *pinterest1=[UIButton buttonWithType:UIButtonTypeCustom text:@"Pin it!" icon:@"icon-html5" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:32],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [pinterest1 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    pinterest1.frame=CGRectMake(10, 260, 150, 50);
    [pinterest1 setRadius:0.0];
    [self.view addSubview:pinterest1];

    UIButton *pinterest2=[UIButton buttonWithType:UIButtonTypeCustom text:@"Pin it!" icon:@"icon-pinterest" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:32],NSForegroundColorAttributeName:[UIColor whiteColor],@"IconFont":[UIFont fontWithName:@"fontawesome" size:20]} andIconPosition:IconPositionLeft];
    [pinterest2 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [pinterest2 setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];

    pinterest2.frame=CGRectMake(10, 320, 280, 50);
    [pinterest2 setRadius:0.0];
    [self.view addSubview:pinterest2];

    UIButton *pinterest3=[UIButton buttonWithType:UIButtonTypeCustom text:@"Pin it!" icon:nil textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:32],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [pinterest3 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [pinterest3 setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    pinterest3.frame=CGRectMake(10, 380, 280, 50);
    [pinterest3 setRadius:0.0];
    [pinterest3 setSeparation:15];
    [self.view addSubview:pinterest3];


    UIAwesomeButton *button4 = [[UIAwesomeButton alloc] initWithFrame:CGRectMake(10, 440, 280, 50) text:@"Testinggggg" iconImage:[UIImage imageNamed:@"bell.png"] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15], NSForegroundColorAttributeName : [UIColor whiteColor], @"IconFont" : [UIFont fontWithName:@"fontawesome" size:40]} andIconPosition:IconPositionLeft];
    [button4 setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [button4 setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    [button4 setRadius:3.0];
    [button4 setSeparation:2];
    [button4 setTextAlignment:NSTextAlignmentRight];
    [button4 setButtonText:[NSString stringWithFormat:@"%@",@"Project!"]];
    [button4 setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forUIControlState:UIControlStateNormal];
    [button4 setButtonText:[NSString stringWithFormat:@"%@",@"Project!"]];
    [button4 setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forUIControlState:UIControlStateNormal];    [button4 setButtonText:[NSString stringWithFormat:@"%@",@"Project!"]];
    [button4 setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forUIControlState:UIControlStateNormal];
    [button4 setActionBlock:^(UIAwesomeButton *button) {
        NSLog(@"Working!");
    }];
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
