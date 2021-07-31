//
//  BigWhiteViewController.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/26.
//

#import "BigWhiteViewController.h"
#import "ShowTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface BigWhiteViewController ()

@end

@implementation BigWhiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    _backButton.frame = CGRectMake(25, 35, 50, 50);
    [_backButton addTarget:self action:@selector(pressBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    UIView* newView = [[UIView alloc] init];
    newView.backgroundColor = [UIColor whiteColor];
    newView.frame = CGRectMake(0, 200, width, 300);
    [self.view addSubview:newView];
    
    _titleArray = [[NSArray alloc] initWithObjects:@"Icon Of Baymax", @"每一个人都需要一个大白", nil];
    _describeArray = [[NSArray alloc] initWithObjects:@"share小白  原创-UI-Icon", @"share小王  原创作品-摄影", nil];
    
    //创建数据视图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, 300) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [newView addSubview:_tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    
    [_tableView registerClass:[ShowTableViewCell class] forCellReuseIdentifier:@"show"];
}

- (void)pressBack:(UIButton*)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShowTableViewCell *showCell = [_tableView dequeueReusableCellWithIdentifier:@"show" forIndexPath:indexPath];
    NSString *imageName = [[NSString alloc] initWithFormat:@"dabai%ld.jpg", indexPath.row + 1];
    showCell.showImageView.image = [UIImage imageNamed:imageName];
    showCell.titleLabel.text = _titleArray[indexPath.row];
    showCell.describeLabel.text = _describeArray[indexPath.row];
    return showCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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
