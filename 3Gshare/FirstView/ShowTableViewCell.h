//
//  ShowTableViewCell.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShowTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *showImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *describeLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *tipsLabel;
@property (nonatomic, strong) UIButton *goodButton;
@property (nonatomic, strong) UIButton *lookButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) NSString *good;
@property (nonatomic, strong) NSString *look;
@property (nonatomic, strong) NSString *share;
@property (nonatomic, assign) int lookNumber;
@property (nonatomic, assign) int shareNumber;

@end

NS_ASSUME_NONNULL_END
