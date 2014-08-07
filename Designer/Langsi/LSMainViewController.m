//
//  LSMainViewController.m
//  Designer
//
//  Created by bejoy on 14/8/7.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "LSMainViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "ZHAppDelegate.h"

#import "HUTransitionVerticalLinesAnimator.h"


@interface LSMainViewController ()

@end

@implementation LSMainViewController

#pragma mark - action 

- (void)feYeAnimation
{
    
}

- (void)mainAnimation
{
    HUTransitionVerticalLinesAnimator  *animator = [[HUTransitionVerticalLinesAnimator alloc] init];
    [animator animateTransition:self.imgV1 toVC:self.imgV2 containerView:self.contentView];
}

#pragma mark - view

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
    

    [self startUpdates];
    

    
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(mainAnimation) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - CMMotionManager
static const NSTimeInterval deviceMotionMin = 0.1;

- (void)startUpdates
{
//    NSTimeInterval delta = 0.005;
    NSTimeInterval updateInterval = deviceMotionMin ;
    
    CMMotionManager *mManager = [(ZHAppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    
    
    if ([mManager isDeviceMotionAvailable] == YES) {
        [mManager setDeviceMotionUpdateInterval:updateInterval];
        [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
            
            
//            double gravityX = deviceMotion.gravity.x;
//            double gravityY = deviceMotion.gravity.y;
//            double gravityZ = deviceMotion.gravity.z;
//            
//            
//            NSLog(@"%f", gravityZ);
            
            
        }];
    }
}



- (void)stopUpdates
{
    CMMotionManager *mManager = [(ZHAppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    
    if ([mManager isDeviceMotionActive] == YES) {
        [mManager stopDeviceMotionUpdates];
    }
}



- (IBAction)enterMain:(id)sender {
    
    [UIView animateWithDuration:KLongDuration animations:^{
        
        self.feiYeView.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            
            [self mainAnimation];
        }


    }];

}
@end
