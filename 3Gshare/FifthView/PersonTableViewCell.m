//
//  PersonTableViewCell.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/27.
//

#import "PersonTableViewCell.h"

@implementation PersonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"person"]) {
        _goodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _lookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cengButton = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *goodImageName = [[NSString alloc] initWithFormat:@"button_zan.png"];
        [_goodButton setImage:[UIImage imageNamed:goodImageName] forState:UIControlStateNormal];
        NSString *lookImageName = [[NSString alloc] initWithFormat:@"button_guanzhu.png"];
        [_lookButton setImage:[UIImage imageNamed:lookImageName] forState:UIControlStateNormal];
        NSString *shareImageName = [[NSString alloc] initWithFormat:@"button_ceng.png"];
        [_cengButton setImage:[UIImage imageNamed:shareImageName] forState:UIControlStateNormal];
        [_goodButton setTitle:@"120" forState:UIControlStateNormal];
        [_goodButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_lookButton setTitle:@"80" forState:UIControlStateNormal];
        [_lookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cengButton setTitle:@"15" forState:UIControlStateNormal];
        [_cengButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_goodButton];
        [self.contentView addSubview:_lookButton];
        [self.contentView addSubview:_cengButton];
        
        _personImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_personImageView];
        
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        _nameLabel.font = [UIFont systemFontOfSize:24];
        
        _desLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_desLabel];
        _desLabel.font = [UIFont systemFontOfSize:13];
        
        _sexLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_sexLabel];
        _sexLabel.font = [UIFont systemFontOfSize:17];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    _personImageView.frame = CGRectMake(25, 25, 100, 100);
    _nameLabel.frame = CGRectMake(150, 15, 300, 40);
    _desLabel.frame = CGRectMake(150, 50, 300, 15);
    _sexLabel.frame = CGRectMake(150, 70, 300, 35);
    
    _goodButton.frame = CGRectMake(150, 110, 40, 40);
    _lookButton.frame = CGRectMake(210, 110, 40, 40);
    _cengButton.frame = CGRectMake(270, 110, 40, 40);
    //改变文字和图像的位置关系 UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
    [_goodButton setTitleEdgeInsets:UIEdgeInsetsMake(20, -40, 0, 0)];
    [_goodButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, 0)];
    [_lookButton setTitleEdgeInsets:UIEdgeInsetsMake(20, -40, 0, 0)];
    [_lookButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, 0)];
    [_cengButton setTitleEdgeInsets:UIEdgeInsetsMake(20, -40, 0, 0)];
    [_cengButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, 0)];
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
