//
//  ActionTableViewCell.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/27.
//

#import "ActionTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@implementation ActionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"action"]) {
        _actionImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_actionImageView];
        _actionLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_actionLabel];
        _actionLabel.textAlignment = NSTextAlignmentLeft;
        _actionLabel.numberOfLines = 0;
    }
    return self;
}

- (void)layoutSubviews {
    _actionImageView.frame = CGRectMake(0, 0, width, 216);
    _actionLabel.frame = CGRectMake(0, 216, width, 20);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
