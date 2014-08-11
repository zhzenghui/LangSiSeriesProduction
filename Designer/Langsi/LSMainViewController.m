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

#import "HUTransitionHorizontalLinesAnimator.h"



@interface LSMainViewController ()
{
    NSMutableArray *viewsArray;
    HUTransitionHorizontalLinesAnimator  *animator ;
    int currentIndex ;
    int f ;
    int t ;
    
}
@end

@implementation LSMainViewController


- (IBAction)transtionTouch:(id)sender
{
    UISwipeGestureRecognizer *sgr = (UISwipeGestureRecognizer *)sender;
    
    
    if (sgr.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (currentIndex < viewsArray.count-1 ) {
            f = currentIndex;
            currentIndex ++;
            t = currentIndex;
        }
        else {
            f = currentIndex;
            currentIndex = 0;
            t = currentIndex ;
            
        }
    }
    else if (sgr.direction == UISwipeGestureRecognizerDirectionRight) {
        
        if (currentIndex == 0 ) {
            f = currentIndex;
            currentIndex = viewsArray.count-1;
            t = currentIndex ;
            
        }
        else {
            f = currentIndex;
            currentIndex --;
            t = currentIndex;
            
        }
   
    }
    
    


    DLog(@"current %i", currentIndex);
    DLog(@"f:%i t:%i", f, t);
    
    [self animationPageForF:f t:t];
    
    
}

#pragma mark - action 

- (void)feYeAnimation
{
    
}


- (void)animationPageForF:(int)fIndex t:(int)tIndex
{

    
    UIView *fView = viewsArray[fIndex];
    UIView *tView = viewsArray[tIndex];
//    DLog(@"f:%@ t:%@", fView, tView);

    [animator animateTransition:fView toVC:tView containerView:self.contentView];
    
    
}

#pragma mark - view

- (void)loadImagesView
{
    
    animator = [[HUTransitionHorizontalLinesAnimator alloc] init];

    viewsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i ++) {
        
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:self.view.frame];
        
        NSString *s = [NSString stringWithFormat:@"雅致-产品%i-图片1",  i];
        imgV.image = [UIImage imageNamed:s];
        
        [viewsArray addObject:imgV];
    }
    

}

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
    [self loadImagesView];
    
    
    self.feiYeView.frame =  self.view.frame;
    [self.view addSubview:self.feiYeView];
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startUpdates];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [self animationPageForF:0 t:1];

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
            
//            {
////            角度
//                CGFloat r = sqrtf(gravityX*gravityX + gravityY*gravityY + gravityZ*gravityZ);
//                CGFloat tiltForwardBackward = acosf(gravityZ/r) * 180.0f / M_PI - 90.0f;
//
//                NSLog(@"%f", tiltForwardBackward);
//                
//                int x = 0 ;
//                
//                if (tiltForwardBackward > 50) {
//                    x = tiltForwardBackward - 50;
//                }
//                else  {
//                    x = 50 - tiltForwardBackward;
//                }
//                
//                self.suoImageView.frame = CGRectMake(x*2, 0, self.suoImageView.frame.size.width, self.suoImageView.frame.size.height);
//            }
            
            {
                //            角度
                CGFloat r = sqrtf(gravityX*gravityX + gravityY*gravityY + gravityZ*gravityZ);
                CGFloat tiltForwardBackward = acosf(gravityZ/r) * 180.0f / M_PI - 90.0f;
                CGFloat x = 0 ;
                
                if (tiltForwardBackward > 50) {
                    x = tiltForwardBackward - 50;
                }
                else  {
                    x = tiltForwardBackward - 50;
                 }
//                NSLog(@"%f", tiltForwardBackward);
//
//                NSLog(@"%f", x);
                self.suoImageView.frame = CGRectMake(x*2, 0, self.suoImageView.frame.size.width, self.suoImageView.frame.size.height);
            }

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
