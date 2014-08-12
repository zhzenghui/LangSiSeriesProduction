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
#import "TransitionVerticalAnimationView.h"


#import "LSModelViewController.h"


@interface LSMainViewController ()
{
    NSMutableArray *viewsArray;
    HUTransitionHorizontalLinesAnimator  *animator ;
    int currentIndex ;
    int f ;
    int t ;
    
    
    TransitionHorizontalAnimationView *tra;
    
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
        
        tra.isDirectionLeft = YES;
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
           tra.isDirectionLeft = NO;
    }
    
    


    DLog(@"current %i", currentIndex);
    DLog(@"f:%i t:%i", f, t);
    
    
    [tra startAnimation:f t:t];
    
    
}

#pragma mark - action 

int i = 0;

- (IBAction)openViewController:(UIButton *)button
{
    
    LSModelViewController *lsVC = nil;
    switch (button.tag) {
        case 1:
        {
            lsVC = [[LSModelViewController alloc] init];

            break;
        }
        case 2:
        {
           
            lsVC = [[LSModelViewController alloc] initWithNibName:@"LSModelViewController" bundle:nil];
            
            break;
        }
        case 3:
        {
            
            lsVC = [[LSModelViewController alloc] init];

            break;
        }
        case 4:
        {
            
            lsVC = [[LSModelViewController alloc] init];

            break;
        }
        case 5:
        {
            
            lsVC = [[LSModelViewController alloc] init];

            break;
        }
        case 6:
        {
            
            lsVC = [[LSModelViewController alloc] init];

            break;
        }
        default:
            break;
    }

    
    
    lsVC.view.alpha = 0;
    
    [UIView animateWithDuration:KMiddleDuration animations:^{
        lsVC.view.alpha = 1;
    }];
    
    [self.view addSubview:lsVC.view];
    [self addChildViewController:lsVC];
}

- (void)feYeAnimation
{
    
}

- (void)page1Animation
{
    UIView *v = viewsArray[0];
    
    [UIView animateWithDuration:KMiddleDuration animations:^{
        
        for (UIView *view in v.subviews) {
            view.alpha = 1;
        }
        
    }];
}


- (void)animationPageForF:(int)fIndex t:(int)tIndex
{

    
    
    
}

#pragma mark - TransitionHorizontalAnimationViewDelegate


- (void)currentIndex:(int)index
{
    DLog(@"current : %i", index);
    
    
//    switch (index) {
//        case 0:
//        {
//            
//            break;
//        }
//        case 1:
//        {
            UIImageView *i1 = (UIImageView *)[viewsArray[index] viewWithTag:1];
            UIImageView *i2 = (UIImageView *)[viewsArray[index] viewWithTag:2];

            i1.alpha = 1;
            i2.alpha = 1;
//            [UIView animateWithDuration:KMiddleDuration animations:^{
//                i1.alpha = 1;
//            } completion:^(BOOL finished) {
//                if (finished) {
//                    [UIView animateWithDuration:KMiddleDuration animations:^{
//                        i2.alpha = 1;
//                    }];
//                }
//            }];
//            
//            
//            
//            break;
//        }
//        default:
//            break;
//    }
    
}
#pragma mark - view

- (void)loadImagesView
{
    
    viewsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i ++) {
        
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:self.view.frame];
        
        NSString *s = [NSString stringWithFormat:@"雅致-产品%i-图片1",  i+1];
        imgV.image = [UIImage imageNamed:s];
        
        [viewsArray addObject:imgV];

        switch (i) {
            case 0:
            {
                UIImageView *imgView1 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品1-图片2" rect:imgV.frame];
                UIImageView *imgView2 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品1-文字" rect:imgV.frame];
                
                imgView1.alpha = 0;
                imgView2.alpha = 0;
                break;
            }
            case 1:
            {
                UIImageView *imgView1 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品2-图片2" rect:RectMake2x(0, 1536-512, 2048, 512)];
                UIImageView *imgView2 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品2-文字1" rect:RectMake2x(0, 1536-512, 2048, 512)];
                
                imgView1.tag = 1;
                imgView2.tag = 2;
                
                imgView1.alpha = 0;
                imgView2.alpha = 0;
                break;
            }
            case 2:
            {
                UIImageView *imgView1 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品3-图片2" rect:imgV.frame];
                UIImageView *imgView3 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品3-图片3" rect:RectMake2x(2048-684, 0, 684, 1536)];
                UIImageView *imgView2 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品3-文字1" rect:RectMake2x(2048-684 , 0, 684, 1536)];
                
                imgView1.tag = 1;
                imgView2.tag = 2;
                imgView3.tag = 3;
                
                imgView1.alpha = 0;
                imgView2.alpha = 0;
                imgView3.alpha = 0;

                break;
            }
                
            default:
                break;
        }
        
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
    
    
    tra = [[TransitionHorizontalAnimationView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.contentView addSubview:tra];
    tra.viewsArray = viewsArray;
    tra.delegate = self;
    [tra addSubViews];

    
    self.feiYeView.frame = self.view.frame;
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
    NSTimeInterval updateInterval = deviceMotionMin ;
    
    CMMotionManager *mManager = [(ZHAppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    
    
    if ([mManager isDeviceMotionAvailable] == YES) {
        [mManager setDeviceMotionUpdateInterval:updateInterval];
        [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
            
            double gravityX = deviceMotion.gravity.x;
            double gravityY = deviceMotion.gravity.y;
            double gravityZ = deviceMotion.gravity.z;

            
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
