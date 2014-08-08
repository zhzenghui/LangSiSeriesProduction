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
#import "TransitionView.h"




@interface LSMainViewController ()

@end

@implementation LSMainViewController

#pragma mark - action 

- (void)feYeAnimation
{
    
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
    
    TransitionView *transtionView   = [[TransitionView alloc] initWithFrame:self.view.frame ];
    [self.contentView addSubview:transtionView];

    NSMutableArray *a = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i ++) {
        
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:transtionView.frame];

        NSString *s = [NSString stringWithFormat:@"雅致-首页-bg0%i",  i];
        imgV.image = [UIImage imageNamed:s];
        
        [a addObject:imgV];
    }
    
    transtionView.viewsArray = a;
    [transtionView startAnimation];
    
    self.feiYeView.frame =  self.view.frame;
    [self.view addSubview:self.feiYeView];
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startUpdates];
    
 
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - CMMotionManager
static const NSTimeInterval deviceMotionMin = 0.1;
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
//#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
- (void)startUpdates
{
//    NSTimeInterval delta = 0.005;
    NSTimeInterval updateInterval = deviceMotionMin ;
    
    CMMotionManager *mManager = [(ZHAppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    
    
    if ([mManager isDeviceMotionAvailable] == YES) {
        [mManager setDeviceMotionUpdateInterval:updateInterval];
        [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
            
            double gravityX = deviceMotion.gravity.x;
            double gravityY = deviceMotion.gravity.y;
            double gravityZ = deviceMotion.gravity.z;
//
//            NSLog(@"x:%2f", gravityX);
//            NSLog(@"y:%2f", gravityY);
//            NSLog(@"z%2f", gravityZ);
            
            
//            角度
            CGFloat r = sqrtf(gravityX*gravityX + gravityY*gravityY + gravityZ*gravityZ);
            CGFloat tiltForwardBackward = acosf(gravityZ/r) * 180.0f / M_PI - 90.0f;
            NSLog(@"%f", tiltForwardBackward);

 

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
            
//            [self mainAnimation];
        }


    }];

}
@end
