//
//  XYViewController.m
//  XYUIKit
//
//  Created by JasonDraem on 04/21/2022.
//  Copyright (c) 2022 JasonDraem. All rights reserved.
//

#import "XYViewController.h"
//#import <XYUIKit/XYButton.h>
#import <XYUIKit/XYUIKit.h>

@interface XYViewController ()

@end

@implementation XYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    XYButton *button = [XYButton buttonWithTitle:@"click" imageName:@"apple-login" titleFontValue:14 weight:0.1 actionTarget:self action:@selector(handleAction) imageDirection:XYImgDirectionType_bottom];
    button.frame = CGRectMake(100, 100, button.width, button.height);
    button.bgColor = [UIColor cyanColor];
    button.titleColor = [UIColor blackColor];
    button.space = 30;
    
    [self.view addSubview:button];
}

- (void)handleAction{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
