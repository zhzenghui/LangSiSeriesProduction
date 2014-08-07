//
//  TransitionView.h
//  Designer
//
//  Created by bejoy on 14/8/7.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

typedef enum {
    AnimationTypeVertical,
    AnimationTypeHorizontal
} AnimationType;

#import <UIKit/UIKit.h>

@interface TransitionView : UIView
{
    
    int currentIndex;
    NSTimer *timer;
    AnimationType currentAnimationType;
    int t;

}

@property(nonatomic, strong) NSMutableArray *viewsArray;

- (void)startAnimation;
- (void)stopAnimation;

@end
