//
//  MyRecommendViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyRecommendViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *falseView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, copy) NSArray *describeArray;
@property (nonatomic, copy) NSArray *timeArray;
@property (nonatomic, copy) NSArray *tipsArray;
@property (nonatomic, strong) NSString *imageName;


@end

NS_ASSUME_NONNULL_END
