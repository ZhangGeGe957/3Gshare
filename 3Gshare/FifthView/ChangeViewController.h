//
//  ChangeViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChangeViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UIView *falseView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) NSArray *nameArray;
@property (nonatomic, strong) NSArray *tipsArray;
@property (nonatomic, strong) UILabel *originalLabel;
@property (nonatomic, strong) UITextField *original;
@property (nonatomic, strong) UILabel *changeLabel;
@property (nonatomic, strong) UITextField *change;
@property (nonatomic, strong) UILabel *changeAgainLabel;
@property (nonatomic, strong) UITextField *changeAgain;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIColor *goodColor;

@end

NS_ASSUME_NONNULL_END
