//
//  FifthViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FifthViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *falseView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *nameArray;

- (void)setUp;
- (void)myUpload;
- (void)myInformation;
- (void)notice;
- (void)myRecommend;
- (void)signOut;

@end

NS_ASSUME_NONNULL_END
