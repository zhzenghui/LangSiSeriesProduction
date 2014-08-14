//
//  ZHSecurityViewController.h
//  Designer
//
//  Created by bejoy on 14/8/14.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "LSViewController.h"

@interface ZHSecurityViewController : LSViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *sv;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *transformImageView;
@property (weak, nonatomic) IBOutlet UIImageView *transform1ImageView;

- (IBAction)openPlay:(id)sender;

@end
