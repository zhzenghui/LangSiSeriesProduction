//
//  ZHWujinViewController.m
//  Designer
//
//  Created by bejoy on 14/8/14.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHWujinViewController.h"
#import "HeYeViewController.h"
#import "BashouViewController.h"
#import "GuDingMaViewController.h"

@interface ZHWujinViewController ()

@end

@implementation ZHWujinViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)open360:(UIButton *)sender {
    
    UIViewController *viewController = nil;
    switch (sender.tag) {
        case 1:
             viewController = [[BashouViewController alloc] init];
            break;
        case 2:
            viewController = [[GuDingMaViewController alloc] init];
            break;
        case 3:
            viewController = [[HeYeViewController alloc] init];
            break;
            
        default:
            break;
    }
    viewController.view.frame = self.view.frame;
    
    [self.view addSubview:viewController.view];
    [self addChildViewController:viewController];
    
}
@end
