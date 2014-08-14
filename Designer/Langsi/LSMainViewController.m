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
#import "ZHWujinViewController.h"
#import "ZHSecurityViewController.h"

@interface LSMainViewController ()
{
    NSTimer *timer;
    
    
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
    
    LSViewController *lsVC = nil;
    switch (button.tag) {
        case 1:
        {
//            lsVC = [[LSModelViewController alloc] init];
            return;
            break;
        }
        case 2:
        {
           
            lsVC = [[LSModelViewController alloc] initWithNibName:@"LSModelViewController" bundle:nil];
            
            break;
        }
        case 3:
        {
            
            lsVC = [[ZHWujinViewController alloc] initWithNibName:@"ZHWujinViewController" bundle:nil];

            break;
        }
        case 4:
        {
            
            lsVC = [[ZHSecurityViewController alloc] initWithNibName:@"ZHSecurityViewController" bundle:nil];

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

- (void)i1AlphaAnimtian:(NSTimer *)ct
{
    NSDictionary *dict = [ct userInfo];

    
    UIImageView *imgView = dict[@"img"];
    [UIView animateWithDuration:KLongDuration animations:^{
        
        if (imgView.alpha == 1 ) {
            imgView.alpha = 0;
        }
        else {
            imgView.alpha = 1;
        }

    }];
}

- (void)i1Animation
{
    
    
    UIImageView *imgView1 = (UIImageView *)[viewsArray[0] viewWithTag:1];//[[ImageView share] addToView:v1 imagePathName:@"雅致-产品1-图片2" rect:v1.frame];
    UIImageView *imgView2 = (UIImageView *)[viewsArray[0] viewWithTag:2];//[[ImageView share] addToView:v1 imagePathName:@"雅致-产品1-文字" rect:v1.frame];
    
    imgView1.alpha = 0;
    imgView2.alpha = 0;
    
    [UIView animateWithDuration:KLongDuration animations:^{
       
        imgView1.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:KLongDuration animations:^{
            
            imgView2.alpha = 1;
        }];
    }];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:kLongLongDuration target:self selector:@selector(i1AlphaAnimtian:) userInfo:@{@"img": imgView1} repeats:YES];
}


- (void)i2Animation
{
    
    UIImageView *imgView1 = (UIImageView *)[viewsArray[1] viewWithTag:1];
    UIImageView *imgView2 = (UIImageView *)[viewsArray[1] viewWithTag:2];
    
 
    
    [UIView animateWithDuration:KLongDuration animations:^{
        
        imgView1.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:KLongDuration animations:^{
            
            imgView2.alpha = 1;
        }];
    }];
}


- (void)i3Animation
{
    
    UIImageView *imgView1 = (UIImageView *)[viewsArray[2] viewWithTag:1];
    UIImageView *imgView2 = (UIImageView *)[viewsArray[2] viewWithTag:2];
    UIImageView *imgView3 = (UIImageView *)[viewsArray[2] viewWithTag:3];

    
    
    [UIView animateWithDuration:KLongDuration animations:^{
        
        imgView1.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:KLongDuration animations:^{
            
            imgView2.alpha = 1;
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:KLongDuration animations:^{
                
                imgView3.alpha = 1;
            }];

            
        }];
    }];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:kLongLongDuration target:self selector:@selector(i1AlphaAnimtian:) userInfo:@{@"img": imgView1} repeats:YES];

}

- (void)i5AlphaAnimtian
{
    UIImageView *imgView1 = (UIImageView *)[viewsArray[4] viewWithTag:1];
    UIImageView *imgView2 = (UIImageView *)[viewsArray[4] viewWithTag:2];
    UIImageView *imgView3 = (UIImageView *)[viewsArray[4] viewWithTag:3];
    
    [UIView animateWithDuration:KLongDuration animations:^{
        
        if (imgView2.alpha == 1 ) {
            imgView1.alpha = 1;
            imgView3.alpha = 1;
            imgView2.alpha = 0;
        }
        else {
            imgView1.alpha = 0;
            imgView3.alpha = 0;
            
            imgView2.alpha = 1;
        }
    }];
    
    
}

- (void)i5Animation
{
    UIImageView *imgView1 = (UIImageView *)[viewsArray[4] viewWithTag:1];
 
    [UIView animateWithDuration:KLongDuration animations:^{
        imgView1.alpha = 1;
    }];
    timer = [NSTimer scheduledTimerWithTimeInterval:kLongLongDuration target:self selector:@selector(i5AlphaAnimtian) userInfo:nil repeats:YES];
}

- (void)i6Animation
{
    UIImageView *imgView1 = (UIImageView *)[viewsArray[5] viewWithTag:1];
 
    
    [UIView animateWithDuration:KLongDuration animations:^{
        
        imgView1.alpha = 1;

    }];
}


- (void)iAnimation:(int)index
{
    UIImageView *imgView1 = (UIImageView *)[viewsArray[index] viewWithTag:1];
    
    
    [UIView animateWithDuration:KLongDuration animations:^{
        
        imgView1.alpha = 1;
        
    }];
}


- (void)currentIndex:(int)index
{
    DLog(@"current : %i", index);
    
    if ([timer isValid]) {
        [timer invalidate];
        
        timer = nil;
    }
    
    switch (index) {
        case 0:
        {
            [self i1Animation];
            break;
        }
        case 1:
        {
        
            [self i2Animation];
            break;
        }
        case 2:
        {
            
            [self i3Animation];
            break;
        }
        case 3:
        {
            break;
        }
        case 4:
        {
            [self i5Animation];
            break;
        }
        case 5:
        {
            [self i6Animation];
            break;
        }
        case 6:
        case 7:
        case 8:
        {
            [self iAnimation:index];
            break;
        }
        case 9:
        {
            break;
        }
        default:
            break;
    }
    
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
                
                imgView1.tag = 1;
                imgView2.tag = 2;
                
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
            case 4:
            {
                UIImageView *imgView1 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品5-图片2" rect:imgV.frame];
                UIImageView *imgView2 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品5-文字1" rect:imgV.frame];
                UIImageView *imgView3 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品5-文字2" rect:imgV.frame];
                
                imgView1.tag = 1;
                imgView2.tag = 2;
                imgView3.tag = 3;
                
                imgView1.alpha = 0;
                imgView2.alpha = 0;
                imgView3.alpha = 0;
                break;
            }
            case 5:
            case 6:
            case 7:
            case 8:
            {
                
                NSString *str = [NSString stringWithFormat:@"雅致-产品%i-文字1", i+1];

                UIImageView *imgView2 = [[ImageView share] addToView:imgV imagePathName:str rect:RectMake2x(0 , 1536-512, 2048, 512)];
                switch (i ) {
                    case 5:
                        imgView2.frame = RectMake2x(0 , 1536-512, 2048, 512);
                        break;
                    case 6:
                        imgView2.frame = imgV.frame;
                        break;
                    case 7:
                        imgView2.frame = imgV.frame;
                        break;
                    case 8:
                        imgView2.frame = imgV.frame;
                        break;
                    default:
                        break;
                }
                imgView2.tag = 1;
                imgView2.alpha = 0;
                break;
            }
           
            case 9:
            {
                UIImageView *imgView2 = [[ImageView share] addToView:imgV imagePathName:@"雅致-产品7-文字1" rect:RectMake2x(0 , 1536-512, 2048, 1536)];
                
                imgView2.tag = 1;
                
                imgView2.alpha = 0;
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
            
            [self i1Animation];
//            [self mainAnimation];
        }


    }];

}
@end
