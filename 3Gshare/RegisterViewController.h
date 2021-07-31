//
//  RegisterViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RegistrationDelegate <NSObject>

- (void)transmissionAccount:(UITextField*)account andPassword:(UITextField*)password;

@end

@interface RegisterViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *accountText;
@property (nonatomic, strong) UITextField *passwordText;
@property (nonatomic, strong) UITextField *confirmText;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, assign) id<RegistrationDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
