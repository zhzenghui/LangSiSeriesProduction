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
    
    
    
}
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

@property(nonatomic, strong) MPMoviePlayerViewController *movieController;
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


-(void) playMovieAtURL: (NSURL*) theURL {
    
    MPMoviePlayerController* theMovie =
    [[MPMoviePlayerController alloc] initWithContentURL: theURL];
    
    theMovie.scalingMode = MPMovieScalingModeAspectFill;
//    theMovie.movieControlMode = MPMovieControlModeHidden;
    
    // Register for the playback finished notification
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector: @selector(myMovieFinishedCallback:)
     name: MPMoviePlayerPlaybackDidFinishNotification
     object: theMovie];
    
    // Movie playback is asynchronous, so this method returns immediately.
    [theMovie play];
    
    [self.view addSubview:theMovie.view];
    
    
}

// When the movie is done, release the controller.
-(void) myMovieFinishedCallback: (NSNotification*) aNotification
{
    MPMoviePlayerController* theMovie = [aNotification object];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver: self
     name: MPMoviePlayerPlaybackDidFinishNotification
     object: theMovie];
    
    // Release the movie instance created in playMovieAtURL:
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




- (void)moviePlayerWillMoveFromWindow;
{
    
}


- (void)playVideoFinished:(NSNotification *)theNotification{

}



- (void)videoPlayBackDidFinish:(NSNotification *)notification {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    // Stop the video player and remove it from view
    [self.videoController stop];
    [self.videoController.view removeFromSuperview];
    self.videoController = nil;
    
    // Display a message
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Video Playback" message:@"Just finished the video playback. The video is now removed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
}



- (void)playMoive:(NSURL*)theURL
{
    self.videoController = [[MPMoviePlayerController alloc] init];
    
    [self.videoController setContentURL:theURL];
    [self.videoController.view setFrame:CGRectMake (0, 0, 320, 460)];
    [self.view addSubview:self.videoController.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(videoPlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.videoController];
    [self.videoController play];

    
}

- (IBAction)openPlay:(id)sender
{
    
    NSString *movieFile = [[NSBundle mainBundle] pathForResource:@"lens1" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:movieFile];
    
    NSLog(@"%@", [url absoluteString]);
    
    [self playMoive:url];
    
//    [self playMovieAtURL:url];

}
@end
