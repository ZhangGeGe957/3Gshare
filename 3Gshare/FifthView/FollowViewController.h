//
//  FollowViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/28.
//

#import <UIKit/UIKit.h>

@protocol NameDelegate <NSObject>

- (void)tranName:(NSMutableArray*)nameMutableArray;

@end

NS_ASSUME_NONNULL_BEGIN

@interface FollowViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *falseView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *nameArray;
@property (nonatomic, strong) NSMutableArray *nameMutableArray;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) id<NameDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
