//
//  ChatTableViewCell.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/28.
//

#import "ChatTableViewCell.h"

@implementation ChatTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"chat"]) {
        _leftTextView = [[UILabel alloc] init];
        _rightTextView = [[UILabel alloc] init];
        _leftImageView = [[UIImageView alloc] init];
        _rightImageView = [[UIImageView alloc] init];
        _dateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_dateLabel];
        [self.contentView addSubview:_rightImageView];
        [self.contentView addSubview:_leftImageView];
        [self.contentView addSubview:_rightTextView];
        [self.contentView addSubview:_leftTextView];
        _rightTextView.textAlignment = NSTextAlignmentRight;
        _leftTextView.textAlignment = NSTextAlignmentLeft;
    }
    return self;
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
