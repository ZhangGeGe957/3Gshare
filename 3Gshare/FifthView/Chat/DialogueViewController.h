//
//  DialogueViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DialogueViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UIView *falseView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) NSMutableArray *arryleftsizewidh;
@property (nonatomic, strong) NSMutableArray *arryrightsizewidh;
@property (nonatomic, strong) NSMutableArray *arryleftsizeheight;
@property (nonatomic, strong) NSMutableArray *arryrightsizeheight;
@property (nonatomic, strong) NSMutableArray *arryright;
@property (nonatomic, strong) NSMutableArray *arryM;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *shuruTextField;
@property (nonatomic, strong) UIColor *goodColor;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic) BOOL isLoadTableView;



@end

NS_ASSUME_NONNULL_END
