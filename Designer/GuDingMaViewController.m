//
//  GuDingMaViewController.m
//  LangSi
//
//  Created by mbp  on 12-12-6.
//  Copyright (c) 2012年 mbp . All rights reserved.
//

#import "GuDingMaViewController.h"

@interface GuDingMaViewController ()
{

    int current;
    int previous;
    int numberOfImages;
    
    UIImageView * blackground;
    UIImageView * arrow;
    int i;



}

@end

@implementation GuDingMaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)back:(UIButton *)button
{
    
    
    [UIView animateWithDuration:KMiddleDuration animations:^{
        self.view.alpha  = 0;
    } completion:^(BOOL finished) {
        
        if (finished) {
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
            
        }
    }];
    
    
    
}

- (void)viewDidLoad
{
    UIImageView * image_back = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 1024, 768)]autorelease];
    image_back.image = [UIImage imageNamed:@"lens五金预览-背景-90固定码.png"];
    [self.view addSubview:image_back];
    
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"雅致-产品-返回"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(1860/2,26/2,110/2,110/2);
    [self.view addSubview:button];
    
    blackground = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 1024, 768)]autorelease];
    blackground.image = [UIImage imageNamed:@"K_1.png"];
    [image_back addSubview:blackground];
    current=1;
    
    arrow = [[[UIImageView alloc]initWithFrame:CGRectMake(1438/2,942/2,22/2,25/2)]autorelease];
    //arrow = [[UIImageView alloc]init];
    arrow.image = [UIImage imageNamed:@"指针-箭头.png"];
    [image_back addSubview:arrow];
    //[arrow release];
    
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(change1) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(1398/2, 799/2, 108/2, 139/2);
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(change2) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(1524/2, 799/2, 108/2, 139/2);
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(change3) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(1649/2, 799/2, 108/2, 139/2);
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(change4) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(1775/2, 799/2, 108/2, 139/2);
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(change5) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(1900/2, 799/2, 108/2, 139/2);
    [self.view addSubview:button];
    i=1;
    
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}




// 白色
-(void)change1
{
    i=1;
    NSString *path = [NSString stringWithFormat:@"K_%d", current];
    path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
    UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
    [blackground setImage:img];
    [img release];
    [self dongarrow];
}

// 黄色
-(void)change2
{
    i=2;
    NSString *path = [NSString stringWithFormat:@"M_%d", current];
    path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
    UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
    [blackground setImage:img];
    [img release];
    [self dongarrow];
}

// 咖啡
-(void)change3
{
    i=3;
    NSString *path = [NSString stringWithFormat:@"O_%d", current];
    path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
    UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
    [blackground setImage:img];
    [img release];
    [self dongarrow];
}

// 黑
-(void)change4
{
    i=4;
    NSString *path = [NSString stringWithFormat:@"L_%d", current];
    path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
    UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
    [blackground setImage:img];
    [img release];
    [self dongarrow];
}

// 粉
-(void)change5
{
    i=5;
    NSString *path = [NSString stringWithFormat:@"N_%d", current];
    path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
    UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
    [blackground setImage:img];
    [img release];
    [self dongarrow];
}

-(void)dongarrow
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    if (i==1) {
        arrow.frame = CGRectMake(1438/2,942/2,22/2,25/2);
    }else if (i==2)
    {
        arrow.frame = CGRectMake(1563/2,942/2,22/2,25/2);
    }else if (i==3)
    {
        arrow.frame = CGRectMake(1688/2,942/2,22/2,25/2);
    }else if (i==4)
    {
        arrow.frame = CGRectMake(1813/2,942/2,22/2,25/2);
    }else
    {
        arrow.frame = CGRectMake(1938/2,942/2,22/2,25/2);
    }
    
    [UIView commitAnimations];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	//if(increment == 0)
	//	increment = 1;
	//[super touchesBegan:touches withEvent:event];
	
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
	
	previous = touchLocation.x;
    //    if (whichone == 4) {
    //        current = 50;
    //    }
    
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	//[super touchesMoved:touches withEvent:event];
    UITouch *touch = [[event allTouches] anyObject];
    
    
    
    
    CGPoint touchLocation = [touch locationInView:self.view];
    
    int location = touchLocation.x;
    /////////////////////////  滑动显示的功能
    
    // is3d = YES;
    
    //////////////////
    int numberOfImages = 200;
    int increment;
    int s = (location-previous);
    if (s<0) {
        s=s;
    }else {
        s=-s;
    }
    increment =s/2;
    
    if((location > previous))
        current += increment;
    //else
    if (location<previous) {
        current -= increment;
        // }
        
        
    }
    previous = location;
    
    if(current > numberOfImages)
        current = 1;
    if(current < 1)
        current = numberOfImages;
    
    if (i==1) {
        NSString *path = [NSString stringWithFormat:@"K_%d", current];
        path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
        UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
        
        
        [blackground setImage:img];
        
        [img release];
        
    }
    if (i==2) {
        NSString *path = [NSString stringWithFormat:@"M_%d", current];
        path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
        UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
        
        
        [blackground setImage:img];
        
        [img release];
        
    }
    
    if (i==3) {
        NSString *path = [NSString stringWithFormat:@"O_%d", current];
        path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
        UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
        
        
        [blackground setImage:img];
        
        [img release];
        
    }
    
    
    if (i==4) {
        NSString *path = [NSString stringWithFormat:@"L_%d", current];
        path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
        UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
        
        
        [blackground setImage:img];
        
        [img release];
        
    }
    
    
    if (i==5) {
        NSString *path = [NSString stringWithFormat:@"N_%d", current];
        path = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
        UIImage* img =  [[UIImage alloc] initWithContentsOfFile:path];
        
        
        [blackground setImage:img];
        
        [img release];
    }
}





-(void)back
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return( (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)|(interfaceOrientation ==UIInterfaceOrientationLandscapeRight));
    
}


@end
