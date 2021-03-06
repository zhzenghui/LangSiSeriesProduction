//
//  ZHAppDelegate.m
//  Designer
//
//  Created by bejoy on 14-3-3.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHAppDelegate.h"
#import "ZHViewController.h"
#import "ZHMainViewController.h"
#import "M2_MainViewController.h"
#import "LSMainViewController.h"

#import "Theme.h"
#import "Customer.h"

#import <iflyMSC/IFlySetting.h>


@interface ZHAppDelegate()
{
    CMMotionManager *motionmanager;
}

@end
@implementation ZHAppDelegate


- (CMMotionManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        motionmanager = [[CMMotionManager alloc] init];
    });
    return motionmanager;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"MyDatabase.sqlite"];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    
    

    UIViewController *vc = [[LSMainViewController alloc] initWithNibName:@"LSMainViewController" bundle:nil];


    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
