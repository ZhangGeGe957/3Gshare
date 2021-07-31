//
//  ShowTableViewCell.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import "ShowTableViewCell.h"

@implementation ShowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"show"]) {
        _lookNumber = 1026;
        _look = [[NSString alloc] initWithFormat:@"%d", _lookNumber];
        _shareNumber = 126;
        _share = [[NSString alloc] initWithFormat:@"%d", _shareNumber];
        _showImageView = [[UIImageView alloc] init];
        _titleLabel = [[UILabel alloc] init];
        _describeLabel = [[UILabel alloc] init];
        _timeLabel = [[UILabel alloc] init];
        _tipsLabel = [[UILabel alloc] init];
        _goodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _lookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *goodImageName = [[NSString alloc] initWithFormat:@"button_zan.png"];
        [_goodButton setImage:[UIImage imageNamed:goodImageName] forState:UIControlStateNormal];
        NSString *lookImageName = [[NSString alloc] initWithFormat:@"button_guanzhu.png"];
        [_lookButton setImage:[UIImage imageNamed:lookImageName] forState:UIControlStateNormal];
        NSString *shareImageName = [[NSString alloc] initWithFormat:@"button_share.png"];
        [_shareButton setImage:[UIImage imageNamed:shareImageName] forState:UIControlStateNormal];
        [_goodButton setTitle:@"957" forState:UIControlStateNormal];
        [_goodButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_lookButton setTitle:_look forState:UIControlStateNormal];
        [_lookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_shareButton setTitle:_share forState:UIControlStateNormal];
        [_shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _goodButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _lookButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _shareButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_goodButton addTarget:self action:@selector(pressGood:) forControlEvents:UIControlEventTouchUpInside];
        [_shareButton addTarget:self action:@selector(pressShare:) forControlEvents:UIControlEventTouchUpInside];
        _goodButton.tag = 857;
        _lookButton.tag = 857;
        _shareButton.tag = 857;
        [self.contentView addSubview:_showImageView];
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_describeLabel];
        [self.contentView addSubview:_timeLabel];
        [self.contentView addSubview:_tipsLabel];
        [self.contentView addSubview:_goodButton];
        [self.contentView addSubview:_lookButton];
        [self.contentView addSubview:_shareButton];
        
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _describeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _tipsLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _describeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _tipsLabel.font = [UIFont systemFontOfSize:14];
        _tipsLabel.numberOfLines = 0;
        _titleLabel.numberOfLines = 0;
        _describeLabel.numberOfLines = 0;
        _timeLabel.numberOfLines = 0;
        
        [_showImageView.layer setMasksToBounds:YES];
        [_showImageView.layer setCornerRadius:10];
        
    }
    return self;
}

- (void)layoutSubviews {
    _showImageView.frame = CGRectMake(0, 0, 201, 150);
    _titleLabel.frame = CGRectMake(210, 0, 220, 40);
    _describeLabel.frame = CGRectMake(210, 40, 220, 20);
    _timeLabel.frame = CGRectMake(210, 90, 220, 20);
    _tipsLabel.frame = CGRectMake(210, 60, 220, 30);
    _goodButton.frame = CGRectMake(220, 110, 60, 40);
    _lookButton.frame = CGRectMake(280, 110, 60, 40);
    _shareButton.frame = CGRectMake(340, 110, 60, 40);
    //改变文字和图像的位置关系 UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
    [_goodButton setTitleEdgeInsets:UIEdgeInsetsMake(20, -50, 0, 0)];
    [_goodButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, 0)];
    [_lookButton setTitleEdgeInsets:UIEdgeInsetsMake(20, -50, 0, 0)];
    [_lookButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, 0)];
    [_shareButton setTitleEdgeInsets:UIEdgeInsetsMake(20, -50, 0, 0)];
    [_shareButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, 0)];
}

- (void)pressGood:(UIButton*)button {
    if (button.tag == 857) {
        [_goodButton setTitle:@"958" forState:UIControlStateNormal];
        button.tag = 957;
    } else {
        [_goodButton setTitle:@"957" forState:UIControlStateNormal];
        button.tag = 857;
    }
}


- (void)pressShare:(UIButton*)button {
    _shareNumber++;
    _share = [[NSString alloc] initWithFormat:@"%d", _shareNumber];
    [_shareButton setTitle:_share forState:UIControlStateNormal];
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
