//
//  ThirdViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirdViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UIView *falseView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *firstTableView;
@property (nonatomic, strong) UITableView *secondTableView;
@property (nonatomic, strong) UITableView *thirdTableView;
@property (nonatomic, copy) NSArray *oneArray;
@property (nonatomic, copy) NSArray *twoArray;
@property (nonatomic, copy) NSArray *threeArray;
@property (nonatomic, copy) NSArray *timeOneArray;
@property (nonatomic, copy) NSArray *timeTwoArray;
@property (nonatomic, copy) NSArray *timeThreeArray;
@property (nonatomic, copy) NSArray *firstArray;
@property (nonatomic, copy) NSArray *secondArray;
@property (nonatomic, copy) NSArray *thirdArray;
@property (nonatomic, copy) NSArray *tipsOneArray;
@property (nonatomic, copy) NSArray *tipsTwoArray;
@property (nonatomic, copy) NSArray *tipsThreeArray;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end

NS_ASSUME_NONNULL_END
