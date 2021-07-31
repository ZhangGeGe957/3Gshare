//
//  SecondViewController.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController<UISearchBarDelegate>

@property (nonatomic, strong) UIView *falseView;
@property (nonatomic, strong) UIButton *uploadButton;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIColor *goodColor;
@end

NS_ASSUME_NONNULL_END
