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
#import <Masonry/Masonry.h>
#import "XYTestModel.h"

@interface XYViewController ()

@property (nonatomic, strong) XYTestModel *model;

@end

@implementation XYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    [self buttonHandle];
    [self exceptionHandle];
}

- (void)exceptionHandle{
//    NSMutableArray *arr = [NSMutableArray array];
//    NSString *str = nil;
//    [arr addObject:str];
    self.model = [[XYTestModel alloc] init];
    [XYTestModel test];
}

- (void)buttonHandle{
    XYButton *bottomImgButton = [XYButton buttonWithTitle:@"bottomImgButton" imageName:@"apple-login" titleFontValue:14 weight:0.1 actionTarget:self action:@selector(handleAction) imageDirection:XYImgDirectionType_bottom];
    bottomImgButton.frame = CGRectMake(10, 100, bottomImgButton.width, bottomImgButton.height);
    bottomImgButton.bgColor = [UIColor cyanColor];
    bottomImgButton.titleColor = [UIColor blackColor];
    bottomImgButton.space = 5;
    [self.view addSubview:bottomImgButton];
    
    XYButton *leftImgButton = [XYButton buttonWithTitle:@"click" imageName:@"apple-login" titleFontValue:14 weight:0.1 actionTarget:self action:@selector(handleAction) imageDirection:XYImgDirectionType_left];
    leftImgButton.frame = CGRectMake(CGRectGetMaxX(bottomImgButton.frame)+10, 100, leftImgButton.width, leftImgButton.height);
    leftImgButton.bgColor = [UIColor cyanColor];
    leftImgButton.titleColor = [UIColor blackColor];
    leftImgButton.space = 5;
    [self.view addSubview:leftImgButton];
    
    XYButton *rightImgButton = [XYButton buttonWithTitle:@"rightImgButton" imageName:@"apple-login" titleFontValue:14 weight:0.1 actionTarget:self action:@selector(handleAction) imageDirection:XYImgDirectionType_right];
    rightImgButton.frame = CGRectMake(CGRectGetMaxX(leftImgButton.frame)+10, 100, rightImgButton.width, rightImgButton.height);
    rightImgButton.bgColor = [UIColor cyanColor];
    rightImgButton.titleColor = [UIColor blackColor];
    rightImgButton.space = 5;
    [self.view addSubview:rightImgButton];
    
    XYButton *topImgButton = [XYButton buttonWithTitle:@"click" imageName:@"apple-login" titleFontValue:14 weight:0.1 actionTarget:self action:@selector(handleAction) imageDirection:XYImgDirectionType_top];
    topImgButton.frame = CGRectMake(CGRectGetMaxX(rightImgButton.frame)+10, 100, topImgButton.width, topImgButton.height);
    topImgButton.bgColor = [UIColor cyanColor];
    topImgButton.titleColor = [UIColor blackColor];
    topImgButton.space = 5;
    [self.view addSubview:topImgButton];
}


- (void)handleAction{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
