//
//  FirstViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *falseView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, copy) NSArray *describeArray;
@property (nonatomic, copy) NSArray *timeArray;
@property (nonatomic, copy) NSArray *tipsArray;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, assign) NSInteger lookNumber;
@property (nonatomic, assign) NSInteger shareNumber;
@property (nonatomic, strong) NSString *good;
@property (nonatomic, strong) NSString *look;
@property (nonatomic, strong) NSString *share;

@end

NS_ASSUME_NONNULL_END
