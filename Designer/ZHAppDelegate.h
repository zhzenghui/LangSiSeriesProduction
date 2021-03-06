//
//  ZHAppDelegate.h
//  Designer
//
//  Created by bejoy on 14-3-3.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import <CoreMotion/CoreMotion.h>


@interface ZHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) User *user;
@property (strong, nonatomic, readonly) CMMotionManager *sharedManager;



@end
