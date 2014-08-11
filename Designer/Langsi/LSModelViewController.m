//
//  LSModelViewController.m
//  Designer
//
//  Created by bejoy on 14/8/11.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "LSModelViewController.h"

@interface LSModelViewController ()
{
    NSArray *fileNamesArray;
}
@end

@implementation LSModelViewController

#pragma mark -  action

- (void)openModle:(UIButton *)button
{

    for (int i  = 1; i <=fileNamesArray.count; i++) {
        UIButton *b = (UIButton *)[self.modlesScrollView viewWithTag:i];
        b.backgroundColor = [UIColor clearColor];
    }
    button.backgroundColor = [UIColor blackColor];
    
    
    
    
}

#pragma mark -  view 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    CGFloat y = 130;
    int i = 0;
    
    
    fileNamesArray = @[@"型号-A31", @"型号-B31",
                                @"型号-C21", @"型号-D42",
                                @"型号-E31", @"型号-P11",
                                @"型号-P21", @"型号-P21Q",
                                @"型号-P31", @"型号-P42"];
    for (NSString *string in fileNamesArray) {
        i ++;
        NSString *path = [NSString stringWithFormat:@"按钮-%@", string];
        
        [[Button share] addToView:self.modlesScrollView addTarget:self rect:RectMake2x(0, y*(i-1), 110, 130) tag:i action:@selector(openModle:) imagePath:path];
    }
    
    [self.modlesScrollView setContentSize:CGSizeMake(55, 65*fileNamesArray.count)];
    
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    
    [super back:nil ];
}
@end
