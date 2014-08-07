//
//  TransitionView.m
//  Designer
//
//  Created by bejoy on 14/8/7.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "TransitionView.h"
#import "HUTransitionVerticalLinesAnimator.h"
#import "HUTransitionHorizontalLinesAnimator.h"

#define KNSTimeInterval 3
#define rand01 (0.9999999*float(rand())/RAND_MAX)



@implementation TransitionView

- (void)initialization
{

    timer = [[NSTimer alloc] init];
    
}

- (void)startAnimation
{
    currentIndex= 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:KNSTimeInterval target:self selector:@selector(animationViews) userInfo:nil repeats:YES];
    

}

- (void)stopAnimation
{
    currentIndex= 0;
    if ( [timer  isValid] ) {
        timer = nil;
    }
}

- (void)animationViews
{
//    随机一个动画type
    int  rand = arc4random() % 2;
    if ( currentAnimationType != rand ) {
        currentAnimationType = rand;
    }
    else {
        currentAnimationType = arc4random() % 2;
    }
    
    
//    切换动画
    int f = currentIndex;
    if (currentIndex == self.viewsArray.count-1) {
        t = 0;

    }
    else {
        t ++ ;

    }
    
    currentIndex = t;


    
    DLog(@"%i", f);
    DLog(@"%i", t);

    
    
    UIView *fView = self.viewsArray[f];
    UIView *tView = self.viewsArray[t];
    
    
    DLog(@"%@", fView);
    DLog(@"%@", tView);
    
    
    if (currentAnimationType == AnimationTypeVertical) {
        DLog(@"Vertical" );

        HUTransitionVerticalLinesAnimator  *animator = [[HUTransitionVerticalLinesAnimator alloc] init];
        [animator animateTransition:fView toVC:tView containerView:self];
    }
    else {
        DLog(@"Horizontal");

        HUTransitionHorizontalLinesAnimator *animator = [[HUTransitionHorizontalLinesAnimator alloc] init];
        [animator animateTransition:fView toVC:tView containerView:self];
    }
    

}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initialization];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
