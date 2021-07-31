//
//  LandViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LandViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *accountText;
@property (nonatomic, strong) UITextField *passwordText;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *resignButton;
@property (nonatomic, strong) UITextField *transAccount;
@property (nonatomic, strong) UITextField *transPassword;

- (void)LoadingInterface;
- (void)RegistrationInterface;
- (void)transmissionAccount:(UITextField*)account andPassword:(UITextField*)password;

@end

NS_ASSUME_NONNULL_END
