//
//  SetUpViewController.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/28.
//

#import "SetUpViewController.h"
#import "MyInformationTableViewCell.h"
#import "BasicViewController.h"
#import "ChangeViewController.h"
#import "NewsViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface SetUpViewController ()

@end

@implementation SetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nameArray = [[NSArray alloc] initWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _falseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 100)];
    [self.view addSubview:_falseView];
    UIImage *falseImage = [UIImage imageNamed:@"background_main.png"];
    UIImageView *falseImageView = [[UIImageView alloc] initWithImage:falseImage];
    falseImageView.frame = CGRectMake(0, 0, width, 100);
    [_falseView addSubview:falseImageView];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    _backButton.frame = CGRectMake(20, 40, 50, 50);
    [_backButton addTarget:self action:@selector(pressBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"设置";
    title.frame = CGRectMake(185, 30, 150, 70);
    title.font = [UIFont systemFontOfSize:28];
    title.textColor = [UIColor whiteColor];
    [_falseView addSubview:title];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, width, height - 100) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[MyInformationTableViewCell class] forCellReuseIdentifier:@"information"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BasicViewController *basic = [[BasicViewController alloc] init];
        basic.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:basic animated:YES completion:nil];
    } else if (indexPath.row == 1) {
        ChangeViewController *change = [[ChangeViewController alloc] init];
        change.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:change animated:YES completion:nil];
    } else if (indexPath.row == 2) {
        NewsViewController *news = [[NewsViewController alloc] init];
        news.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:news animated:YES completion:nil];
    } else if (indexPath.row == 3) {
        UIAlertController *tips = [UIAlertController alertControllerWithTitle:nil message:@"目前没有新内容！" preferredStyle:UIAlertControllerStyleAlert];
        [tips addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:tips animated:YES completion:nil];
    } else if (indexPath.row == 4) {
        UIAlertController *tips = [UIAlertController alertControllerWithTitle:nil message:@"缓存已清除" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:tips animated:YES completion:nil];
        _timerView = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoScroll:) userInfo:@"帅哥哥" repeats:YES];
    }
}

- (void)autoScroll:(NSTimer*)timer {
    [_timerView invalidate];
    _timerView = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyInformationTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"information" forIndexPath:indexPath];
    cell.label.text = _nameArray[indexPath.row];
    cell.numberLabel.text = nil;
    cell.goodImageView.image = [UIImage imageNamed:@"img3.png"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)pressBack:(UIButton*)button {
    [self dismissViewControllerAnimated:YES completion:nil];
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
