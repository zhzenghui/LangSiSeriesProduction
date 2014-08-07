//
//  LSMainViewController.m
//  Designer
//
//  Created by bejoy on 14/8/7.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "LSMainViewController.h"
#import <CoreMotion/CoreMotion.h>



@interface LSMainViewController ()

@end

@implementation LSMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView ];
    
    
    self.feiYeView.frame =  self.view.frame;
    [self.view addSubview:self.feiYeView];
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CMMotionManager *motionManager = [[CMMotionManager alloc]init];

    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
