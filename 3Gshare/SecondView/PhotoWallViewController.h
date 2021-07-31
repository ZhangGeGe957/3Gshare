//
//  PhotoWallViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//代理协议，在哪里执行代理函数就在哪里写代理协议，实现的类要遵守这个代理协议
@protocol PhotoWallDelegate <NSObject>

//代理函数要写在要实现的类中，定义代理的类，即现在这个类之调用这个代理函数
- (void)changePhoto:(NSMutableArray *)imageArray;

@end

@interface PhotoWallViewController : UIViewController

@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIButton* selectButton;
@property (assign, nonatomic) NSInteger tag;
@property (nonatomic, strong) NSMutableArray *imageArray;
//定义一个代理对象，在哪里执行代理函数就在哪里加代理对象
@property (assign, nonatomic) id<PhotoWallDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
