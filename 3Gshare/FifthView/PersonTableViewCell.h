//
//  PersonTableViewCell.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *personImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UILabel *sexLabel;
@property (nonatomic, strong) UIButton *goodButton;
@property (nonatomic, strong) UIButton *lookButton;
@property (nonatomic, strong) UIButton *cengButton;


@end

NS_ASSUME_NONNULL_END
