//
//  UploadViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UploadViewController : UIViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *falseView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *photoButton;
@property (nonatomic, strong) UITextField *titleText;
@property (nonatomic, strong) UITextField *describeText;
@property (nonatomic, strong) UIButton *releaseButton;
@property (nonatomic, strong) UIColor *goodColor;
@property (nonatomic, strong) UILabel *shouLabel;
@property (nonatomic, strong) UILabel *quantity;
@property (nonatomic, strong) UIColor *color;
@property UITableView *tableView;
@property UIButton *button;
@property NSMutableArray *strArr;
@property NSMutableString *str;
@property BOOL openSelect;

- (void)allInit;

@end

NS_ASSUME_NONNULL_END
