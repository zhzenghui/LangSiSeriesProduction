//
//  LSMainViewController.h
//  Designer
//
//  Created by bejoy on 14/8/7.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "LSViewController.h"
#import "TransitionHorizontalAnimationView.h"
#import <MediaPlayer/MediaPlayer.h>



@interface LSMainViewController : UIViewController<TransitionHorizontalAnimationViewDelegate>



// 扉页
@property (strong, nonatomic) IBOutlet UIView *feiYeView;
@property (weak, nonatomic) IBOutlet UIImageView *suoImageView;

@property (weak, nonatomic) IBOutlet UIImageView *imgV1;
@property (weak, nonatomic) IBOutlet UIImageView *imgV2;
@property (weak, nonatomic) IBOutlet UIView *contentView;


- (IBAction)enterMain:(id)sender;
@property (strong, nonatomic) MPMoviePlayerController *videoController;

@end
