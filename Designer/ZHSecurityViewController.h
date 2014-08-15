//
//  ZHSecurityViewController.h
//  Designer
//
//  Created by bejoy on 14/8/14.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "LSViewController.h"
#import <MediaPlayer/MediaPlayer.h>



@interface ZHSecurityViewController : UIViewController<UIScrollViewDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *sv;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *transformImageView;
@property (weak, nonatomic) IBOutlet UIImageView *transform1ImageView;


@property (strong, nonatomic) MPMoviePlayerController *videoController;


- (IBAction)openPlay:(id)sender;

@end
