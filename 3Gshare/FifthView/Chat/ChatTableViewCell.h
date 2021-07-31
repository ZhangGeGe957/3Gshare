//
//  ChatTableViewCell.h
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *rightTextView;
@property (nonatomic, strong) UILabel *leftTextView;
@property (nonatomic, strong) UILabel *dateLabel;

@end

NS_ASSUME_NONNULL_END
