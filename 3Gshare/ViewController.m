//
//  ViewController.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import "ViewController.h"
#import "LandViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIImage *image = [UIImage imageNamed:@"1 开机界面.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, width, height);
    [self.view addSubview:imageView];
    
    _timerView = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(overTimer:) userInfo:@"帅哥哥" repeats:YES];
    
}

- (void)overTimer:(NSTimer*)timer {
    
    [_timerView invalidate];
    
    LandViewController *landView = [[LandViewController alloc] init];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    landView.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:landView animated:YES completion:nil];
    
}

@end
