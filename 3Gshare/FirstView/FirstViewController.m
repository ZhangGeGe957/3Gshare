//
//  FirstViewController.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import "FirstViewController.h"
#import "RollTableViewCell.h"
#import "ShowTableViewCell.h"
#import "ContentViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface FirstViewController ()<TransmissionDelegate>

//选中的cell
@property (nonatomic, strong) ShowTableViewCell *cell;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height - 90) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _falseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 100)];
    [self.view addSubview:_falseView];
    UIImage *falseImage = [UIImage imageNamed:@"background_main.png"];
    UIImageView *falseImageView = [[UIImageView alloc] initWithImage:falseImage];
    falseImageView.frame = CGRectMake(0, 0, width, 100);
    [_falseView addSubview:falseImageView];
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"SHARE";
    title.frame = CGRectMake(170, 30, 150, 70);
    title.font = [UIFont systemFontOfSize:28];
    title.textColor = [UIColor whiteColor];
    [_falseView addSubview:title];
    
    _titleArray = [[NSArray alloc] initWithObjects:@"假日", @"国外画册欣赏", @"collection扁平设计", @"版式整理术：高校解决多风格要求", nil];
    _describeArray = [[NSArray alloc] initWithObjects:@"原创-插画-练习习作", @"平面设计——画册设计", @"平面设计——海报设计", @"平面设计——样式设计", nil];
    _timeArray = [[NSArray alloc] initWithObjects:@"15分钟前", @"1小时前", @"30分钟前", @"20分钟前", nil];
    _tipsArray = [[NSArray alloc] initWithObjects:@"share小白", @"share帅哥", @"share时尚", @"share复古", nil];
    
    [_tableView registerClass:[RollTableViewCell class] forCellReuseIdentifier:@"roll"];
    [_tableView registerClass:[ShowTableViewCell class] forCellReuseIdentifier:@"show"];

}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        RollTableViewCell *rollCell = [_tableView dequeueReusableCellWithIdentifier:@"roll" forIndexPath:indexPath];
        return rollCell;
    } else {
        ShowTableViewCell *showCell = [_tableView dequeueReusableCellWithIdentifier:@"show" forIndexPath:indexPath];
        _imageName = [[NSString alloc] initWithFormat:@"list_img%ld.png", indexPath.row];
        showCell.showImageView.image = [UIImage imageNamed:_imageName];
        showCell.titleLabel.text = _titleArray[indexPath.row - 1];
        showCell.describeLabel.text = _describeArray[indexPath.row - 1];
        showCell.timeLabel.text = _timeArray[indexPath.row - 1];
        showCell.tipsLabel.text = _tipsArray[indexPath.row - 1];
        if (indexPath.row == 1) {
            _look = showCell.lookButton.titleLabel.text;
            _lookNumber = [_look integerValue];
        }
        return showCell;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 250;
    } else {
        return 150;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 53;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

//脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat min = -47.0;
    CGFloat max = 17.0;
    CGFloat now = _tableView.contentOffset.y;
    CGFloat alpha = (now - min) / (max - min);
    _falseView.alpha = 1 - alpha;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        //获取当前选中cell
        _cell = [self.tableView cellForRowAtIndexPath:indexPath];
                                   
        ContentViewController *content = [[ContentViewController alloc] init];
        content.delegate = self;
        content.modalPresentationStyle = UIModalPresentationFullScreen;
        _lookNumber++;
        _look = [[NSString alloc] initWithFormat:@"%ld", _lookNumber];
        content.look = _look;
        [_cell.lookButton setTitle:_look forState:UIControlStateNormal];
        _good = _cell.goodButton.titleLabel.text;
        content.good = _good;
        content.share = _cell.shareButton.titleLabel.text;
        [self presentViewController:content animated:YES completion:nil];
    }
}

- (void)transmissionNumber:(NSMutableArray *)numberArray {
    [_cell.goodButton setTitle:numberArray[0] forState:UIControlStateNormal];
    [_cell.shareButton setTitle:numberArray[1] forState:UIControlStateNormal];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
