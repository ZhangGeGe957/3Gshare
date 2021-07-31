//
//  LandViewController.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import "LandViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "RegisterViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface LandViewController ()<RegistrationDelegate>

@end

@implementation LandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _transAccount = [[UITextField alloc] init];
    _transPassword = [[UITextField alloc] init];
    
    UIImage *backImage = [UIImage imageNamed:@"kaiji1.png"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = CGRectMake(0, 0, width, height);
    [self.view addSubview:backImageView];
    
    UIImage *userImage = [UIImage imageNamed:@"user_img.png"];
    UIImage *passImage = [UIImage imageNamed:@"pass_img.png"];
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
    UIImageView *passImageView = [[UIImageView alloc] initWithImage:passImage];
    userImageView.backgroundColor = [UIColor whiteColor];
    [userImageView.layer setMasksToBounds:YES];
    [userImageView.layer setCornerRadius:5.0];
    passImageView.backgroundColor = [UIColor whiteColor];
    [passImageView.layer setMasksToBounds:YES];
    [passImageView.layer setCornerRadius:5.0];
    userImageView.frame = CGRectMake(50, 404, 50, 50);
    passImageView.frame = CGRectMake(50, 474, 50, 50);
    [backImageView addSubview:userImageView];
    [backImageView addSubview:passImageView];
    
    _accountText = [[UITextField alloc] init];
    _passwordText = [[UITextField alloc] init];
    _accountText.delegate = self;
    _passwordText.delegate = self;
    _accountText.frame = CGRectMake(100, 404, 250, 50);
    _passwordText.frame = CGRectMake(100, 474, 250, 50);
    _accountText.keyboardType = UIKeyboardTypeDefault;
    _passwordText.keyboardType = UIKeyboardTypeDefault;
    _accountText.borderStyle = UITextBorderStyleRoundedRect;
    _passwordText.borderStyle = UITextBorderStyleRoundedRect;
    _passwordText.secureTextEntry = YES;
    [self.view addSubview:_accountText];
    [self.view addSubview:_passwordText];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _resignButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_resignButton setTitle:@"注册" forState:UIControlStateNormal];
    _loginButton.titleLabel.tintColor = [UIColor whiteColor];
    _resignButton.titleLabel.tintColor = [UIColor whiteColor];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:20];
    _resignButton.titleLabel.font = [UIFont systemFontOfSize:20];
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
    [_loginButton.layer setBorderWidth:2];//设置边界的宽度
    [_loginButton.layer setBorderColor:color];//设置边界的颜色
    [_resignButton.layer setBorderWidth:2];//设置边界的宽度
    [_resignButton.layer setBorderColor:color];//设置边界的颜色
    [_loginButton.layer setMasksToBounds:YES];
    [_loginButton.layer setCornerRadius:5.0];
    [_resignButton.layer setMasksToBounds:YES];
    [_resignButton.layer setCornerRadius:5.0];
    _loginButton.frame = CGRectMake(100, 550, 80, 40);
    _resignButton.frame = CGRectMake(220, 550, 80, 40);
    [_loginButton addTarget:self action:@selector(pressLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    [_resignButton addTarget:self action:@selector(pressResignButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    [self.view addSubview:_resignButton];
    
    UIButton *autoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [autoButton setTitle:@"自动登录" forState:UIControlStateNormal];
    autoButton.frame = CGRectMake(80, 605, 120, 40);
    [autoButton addTarget:self action:@selector(autoLogin:) forControlEvents:UIControlEventTouchUpInside];
    autoButton.titleLabel.tintColor = [UIColor blueColor];
    [self.view addSubview:autoButton];
    autoButton.tag = 857;
    
    UIImage *logoImage = [UIImage imageNamed:@"login_logo.png"];
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:logoImage];
    logoImageView.frame = CGRectMake(115, 100, 200, 200);
    [backImageView addSubview:logoImageView];
    
    UIImage *actionImage = [UIImage imageNamed:@"actionbar.png"];
    UIImageView *actionImageView = [[UIImageView alloc] initWithImage:actionImage];
    actionImageView.frame = CGRectMake(-300, 300, 1000, 100);
    [backImageView addSubview:actionImageView];
    
}

- (void)pressLoginButton:(UIButton*)button {
    
//    [self LoadingInterface];
    
    if ([_accountText.text isEqualToString:@""] || [_passwordText.text isEqualToString:@""]) {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"您输入的账号还未注册，请注册后重新登录" preferredStyle:UIAlertControllerStyleAlert];
        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:warning animated:YES completion:nil];
        return;
    }

    if ([_accountText.text isEqualToString:_transAccount.text] && [_passwordText.text isEqualToString:_transPassword.text]) {
        [self LoadingInterface];
    } else {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"您输入的账号或密码有误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:warning animated:YES completion:nil];
    }
    
}

- (void)pressResignButton:(UIButton*)button {
    
    [self RegistrationInterface];
    
}

- (void)autoLogin:(UIButton*)button {
    if (button.tag == 857) {
        UIImage *image = [UIImage imageNamed:@"my_button_pressed.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.tag = 1;
        button.tag = 957;
        imageView.frame = CGRectMake(0, 0, 30, 30);
        [imageView.layer setMasksToBounds:YES];
        [imageView.layer setCornerRadius:15.0];
        [button addSubview:imageView];
    } else {
        for (UIImageView *view in button.subviews) {
            if (view.tag == 1) {
                [view removeFromSuperview];
            }
        }
        button.tag = 857;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_accountText resignFirstResponder];
    [_passwordText resignFirstResponder];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(0, -50, width, height);
    }];
    [UIView setAnimationsEnabled:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(0, 0, width, height);
    }];
    [UIView setAnimationsEnabled:YES];
}

- (void)LoadingInterface {
    
    FirstViewController *firstView = [[FirstViewController alloc] init];
    SecondViewController *secondView = [[SecondViewController alloc] init];
    ThirdViewController *thirdView = [[ThirdViewController alloc] init];
    FourthViewController *fourthView = [[FourthViewController alloc] init];
    FifthViewController *fifthView = [[FifthViewController alloc] init];
    
    UITabBarItem *firstTabBar = [[UITabBarItem alloc] init];
    firstTabBar.image = [UIImage imageNamed:@"radio_button_home.png"];
    firstView.tabBarItem = firstTabBar;
    UITabBarItem *secondTabBar = [[UITabBarItem alloc] init];
    secondTabBar.image = [UIImage imageNamed:@"radio_button_search.png"];
    secondView.tabBarItem = secondTabBar;
    UITabBarItem *thirdTabBar = [[UITabBarItem alloc] init];
    thirdTabBar.image = [UIImage imageNamed:@"radio_button_note.png"];
    thirdView.tabBarItem = thirdTabBar;
    UITabBarItem *fourthTabBar = [[UITabBarItem alloc] init];
    fourthTabBar.image = [UIImage imageNamed:@"radio_button_cup.png"];
    fourthView.tabBarItem = fourthTabBar;
    UITabBarItem *fifthTabBar = [[UITabBarItem alloc] init];
    fifthTabBar.image = [UIImage imageNamed:@"radio_button_user.png"];
    fifthView.tabBarItem = fifthTabBar;

    
    NSArray *viewArray = [[NSArray alloc] initWithObjects:firstView, secondView, thirdView, fourthView, fifthView, nil];
    UITabBarController *mainController = [[UITabBarController alloc] init];
    mainController.viewControllers = viewArray;
    mainController.tabBar.translucent = NO;
    mainController.tabBar.tintColor = [UIColor whiteColor];
    mainController.tabBar.barTintColor = [UIColor blackColor];
    
    mainController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:mainController animated:YES completion:nil];
}

- (void)RegistrationInterface {
    RegisterViewController *registerView = [[RegisterViewController alloc] init];
    registerView.delegate = self;
    
    registerView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerView animated:YES completion:nil];
}
- (void)transmissionAccount:(UITextField*)account andPassword:(UITextField*)password {
    _transAccount = account;
    _transPassword = password;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
