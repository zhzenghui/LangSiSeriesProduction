//
//  TransitionAnimationView.h
//  Designer
//
//  Created by bejoy on 14/8/11.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TransitionHorizontalAnimationView : UIView






@property(nonatomic, strong) NSMutableArray *viewsArray;

@property(nonatomic, assign) bool isDirectionLeft;


- (void)startAnimation:(int)fIndex t:(int)tIndex;
- (void)addSubViews;



@end