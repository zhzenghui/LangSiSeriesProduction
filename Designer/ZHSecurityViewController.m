//
//  ZHSecurityViewController.m
//  Designer
//
//  Created by bejoy on 14/8/14.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHSecurityViewController.h"
#import <MediaPlayer/MediaPlayer.h>



@interface ZHSecurityViewController ()
{
    
    MPMoviePlayerViewController *movieController;
    
}
@end

@implementation ZHSecurityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.sv addSubview:self.contentView];
    self.sv.contentSize = self.contentView  .frame.size;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    self.transformImageView.alpha = floor(scrollView.contentOffset.x/102.4)/10;

    self.transform1ImageView.alpha = 1-floor(scrollView.contentOffset.x/102.4)/10;
}

- (IBAction)openPlay:(id)sender
{
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"Lens-60s-Mand-1211.mp4" ofType:nil];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:fileURL];
    [self presentMoviePlayerViewControllerAnimated:movieController];
    movieController.moviePlayer.fullscreen = YES;
    [movieController.moviePlayer play];
}
@end
