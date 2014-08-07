//
//  LSMainViewController.h
//  Designer
//
//  Created by bejoy on 14/8/7.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "LSViewController.h"

@interface LSMainViewController : LSViewController



// 扉页
@property (strong, nonatomic) IBOutlet UIView *feiYeView;
@property (weak, nonatomic) IBOutlet UIImageView *suoImageView;


- (IBAction)enterMain:(id)sender;

@end
