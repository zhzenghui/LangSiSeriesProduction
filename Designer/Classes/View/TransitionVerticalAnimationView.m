//
//  TransitionAnimationView.m
//  Designer
//
//  Created by bejoy on 14/8/11.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "TransitionVerticalAnimationView.h"
#import "HUTransitionVerticalLinesAnimator.h"







@implementation TransitionVerticalAnimationView

#define VLANIMATION_TIME1 0.01
#define VLANIMATION_TIME2 2.0
/// returns the duration of the verticalLinesAnimation
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return VLANIMATION_TIME1+VLANIMATION_TIME2;
}

#define VLINEWIDTH  256



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}


- (void)startAnimation:(int)fIndex t:(int)tIndex
{
    
    UIView *fView = self.viewsArray[fIndex];
    UIView *tView = self.viewsArray[tIndex];
    
    [self addSubview:fView];
    [self addSubview:tView];
    
    [self animateTransition:fView toVC:tView];
    
}




- (void)animateTransition:(UIView *)fromVC toVC:(UIView *)toVC {
    
    NSArray *outgoingLineViews = [self cutView:fromVC intoSlicesOfWidth:VLINEWIDTH];
    
    for (UIView *v in outgoingLineViews) {
        [self addSubview:v];
    }

    CGFloat toViewStartY = toVC.frame.origin.y;
    
    fromVC.hidden  =  YES;
//    toVC.hidden = YES;
    
    [UIView animateWithDuration:VLANIMATION_TIME1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        //This is basically a hack to get the incoming view to render before I snapshot it.
    } completion:^(BOOL finished) {

        toVC.alpha = 1;
        UIView *mainInSnap = [toVC snapshotViewAfterScreenUpdates:YES];
        //cut it into vertical slices
        NSArray *incomingLineViews = [self cutView:mainInSnap intoSlicesOfWidth:VLINEWIDTH];
        
        //move the slices in to start position (mess them up)
        [self repositionViewSlices:incomingLineViews moveFirstFrameUp:NO];
        
        //add the slices to the content view.
        for (UIView *v in incomingLineViews) {
            [self addSubview:v];
        }
        toVC.hidden = YES;
        
        [UIView animateWithDuration:VLANIMATION_TIME2 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self repositionViewSlices:outgoingLineViews moveFirstFrameUp:YES];
            [self resetViewSlices:incomingLineViews toYOrigin:toViewStartY];
        } completion:^(BOOL finished) {
            if (finished) {
                fromVC.hidden = NO;
                toVC.hidden = NO;
                [toVC setNeedsUpdateConstraints];
                for (UIView *v in incomingLineViews) {
                    [v removeFromSuperview];
                }
                for (UIView *v in outgoingLineViews) {
                    [v removeFromSuperview];
                }
                
            }
        }];
        
    }];
    
}




/**
 cuts a \a view into an array of smaller views of \a width
 @param view the view to be sliced up
 @param width The width of each slice
 @returns A mutable array of the sliced views with their frames representative of their position in the sliced view.
 */
-(NSMutableArray *)cutView:(UIView *)view intoSlicesOfWidth:(float)width{
    
    CGFloat lineHeight = CGRectGetHeight(view.frame);
    
    NSMutableArray *lineViews = [NSMutableArray array];
    
    for (int x=0; x<CGRectGetWidth(view.frame); x+=width) {
        CGRect subrect = CGRectMake(x, 0, width, lineHeight);
        
        
        UIView *subsnapshot;
        subsnapshot = [view resizableSnapshotViewFromRect:subrect afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
        subsnapshot.frame = subrect;
        
        [lineViews addObject:subsnapshot];
        
        [self addSubview:subsnapshot];

    }
    return lineViews;
    
}

/**
 repositions an array of \a views alternatively up and down by their frames height
 @param views The array of views to reposition
 @param startUp start with the first view moving up (YES) or down (NO)
 */
-(void)repositionViewSlices:(NSArray *)views moveFirstFrameUp:(BOOL)startUp{
    
    BOOL up = startUp;
    CGRect frame;
    float height;
    for (UIView *line in views) {
        frame = line.frame;
        height = CGRectGetHeight(frame) * RANDOM_FLOAT(1.0, 4.0);
        
        frame.origin.y += (up)?-height:height;
        
        //save the new position
        line.frame = frame;
        
        up = !up;
    }
}

/**
 resets the views back to a specified y origin.
 @param views The array of uiview objects to reposition
 @param y The y origin to set all the views frames to.
 */
-(void)resetViewSlices:(NSArray *)views toYOrigin:(CGFloat)y{
    
    CGRect frame;
    for (UIView *line in views) {
        frame = line.frame;
        
        frame.origin.y = y;
        
        //save the new position
        line.frame = frame;
        
    }
}

@end
