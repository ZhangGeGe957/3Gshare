//
//  UploadViewController.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/27.
//

#import "UploadViewController.h"
#import "SelectTableViewCell.h"
#import "PhotoWallViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface UploadViewController ()<PhotoWallDelegate>

@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _goodColor = [UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1];
    _color = [UIColor colorWithRed:240/255.0 green:248/255.0 blue:255/255.0 alpha:1];
    self.view.backgroundColor = [UIColor whiteColor];
    _falseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 100)];
    [self.view addSubview:_falseView];
    UIImage *falseImage = [UIImage imageNamed:@"background_main.png"];
    UIImageView *falseImageView = [[UIImageView alloc] initWithImage:falseImage];
    falseImageView.frame = CGRectMake(0, 0, width, 100);
    [_falseView addSubview:falseImageView];
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"上传";
    title.frame = CGRectMake(185, 30, 150, 70);
    title.font = [UIFont systemFontOfSize:28];
    title.textColor = [UIColor whiteColor];
    [_falseView addSubview:title];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    _backButton.frame = CGRectMake(20, 40, 50, 50);
    [_backButton addTarget:self action:@selector(pressBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    [self allInit];
    
    
//----------------------------------------------------------------
    
    _openSelect = NO;
    
    _strArr = [[NSMutableArray alloc] init];
    [_strArr addObject:@"原创作品"];
    [_strArr addObject:@"设计资料"];
    [_strArr addObject:@"设计师观点"];
    [_strArr addObject:@"设计教程"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(290, 210, 100, 25) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[SelectTableViewCell class] forCellReuseIdentifier:@"shuai"];
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:_button];
    _button.frame = CGRectMake(391, 210, 25, 25);
    [_button setImage:[UIImage imageNamed:@"shou.png"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(pressNewButton:) forControlEvents:UIControlEventTouchUpInside];
    _button.backgroundColor = _color;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"shuai" forIndexPath:indexPath];
    cell.backgroundColor = _color;
    cell.textLabel.text = _strArr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //如果是未打开的，行数为1
    if(_openSelect == NO){
        return 1;
    } else {
        //如果已经打开tableview，行数为4
        return 4;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //记录点击的元素
    _str = [NSMutableString stringWithString:_strArr[indexPath.row]];
    //将该元素提到第一个，insertObject：atIndex：函数自动后移其他元素
    [_strArr insertObject:_str atIndex:0];
    //因为加入了一个元素，选中元素本来存在的地方就后移一个，删除该元素
    [_strArr removeObjectAtIndex:indexPath.row + 1];
    //收缩tableview
    _openSelect = NO;
    //将tableview的大小改为一格的大小
    _tableView.frame = CGRectMake(290, 210, 100, 25);
    //button图标变为合上的图标
    [_button setImage:[UIImage imageNamed:@"close1.png"] forState:UIControlStateNormal];
    //刷新tableview
    [_tableView reloadData];
    
}

- (void)pressNewButton:(UIButton*)button {
    if (_openSelect == NO) {
        _tableView.frame = CGRectMake(290, 210, 100, 100);
        _openSelect = YES;
        [button setImage:[UIImage imageNamed:@"zhan.png"] forState:UIControlStateNormal];
    } else {
        _tableView.frame = CGRectMake(290, 210, 100, 25);
        _openSelect = NO;
        [button setImage:[UIImage imageNamed:@"shou.png"] forState:UIControlStateNormal];
    }
    
    //刷新数据
    [_tableView reloadData];
}

//---------------------------------------------------------------------

- (void)allInit {
    _photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _photoButton.backgroundColor = [UIColor grayColor];
    [_photoButton setTitle:@"选择图片" forState:UIControlStateNormal];
    _photoButton.frame = CGRectMake(20, 150, 250, 126);
    [_photoButton addTarget:self action:@selector(photoWall:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_photoButton];
    
    _titleText = [[UITextField alloc] init];
    _titleText.frame = CGRectMake(0, 400, width, 50);
    _titleText.delegate = self;
    _titleText.keyboardType = UIKeyboardTypeDefault;
    _titleText.borderStyle = UITextBorderStyleLine;
    _titleText.placeholder = @"作品名称";
    _titleText.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:_titleText];
    
    _describeText = [[UITextField alloc] init];
    _describeText.frame = CGRectMake(0, 460, width, 200);
    _describeText.delegate = self;
    _describeText.keyboardType = UIKeyboardTypeDefault;
    _describeText.borderStyle = UITextBorderStyleLine;
    _describeText.placeholder = @"请添加作品说明/文章内容......";
    _describeText.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    _describeText.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_describeText];
    
    _releaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _releaseButton.backgroundColor = [UIColor grayColor];
    [_releaseButton setTitle:@"发布" forState:UIControlStateNormal];
    _releaseButton.frame = CGRectMake(12, 670, 400, 50);
    [_releaseButton addTarget:self action:@selector(pressRelease:) forControlEvents:UIControlEventTouchUpInside];
    _releaseButton.titleLabel.font = [UIFont systemFontOfSize:26];
    _releaseButton.backgroundColor = _goodColor;
    [_releaseButton.layer setMasksToBounds:YES];
    [_releaseButton.layer setCornerRadius:5];
    [self.view addSubview:_releaseButton];
    
    UIButton *autoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [autoButton setTitle:@"禁止下载" forState:UIControlStateNormal];
    autoButton.frame = CGRectMake(20, 750, 120, 40);
    [autoButton addTarget:self action:@selector(noDownload:) forControlEvents:UIControlEventTouchUpInside];
    autoButton.titleLabel.tintColor = [UIColor blueColor];
    autoButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:autoButton];
    autoButton.tag = 857;
    
    NSArray *oneArray = [[NSArray alloc] initWithObjects:@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他", nil];
    int m = 0;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 4; j++) {
            UIButton *oneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            oneButton.frame = CGRectMake(8 + 105 * j, 300 + 45 * i, 100, 40);
            oneButton.backgroundColor = [UIColor whiteColor];
            [oneButton setTitle:oneArray[m] forState:UIControlStateNormal];
            oneButton.titleLabel.font = [UIFont systemFontOfSize:18];
            [oneButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:oneButton];
            oneButton.tintColor = [UIColor blackColor];
            [oneButton.layer setMasksToBounds:YES];
            [oneButton.layer setCornerRadius:10];
            oneButton.tag = 101 + m;
            m++;
        }
    }
    
    UIImage *dingwei = [UIImage imageNamed:@"dingwei.png"];
    UIImageView *dingweiView = [[UIImageView alloc] initWithImage:dingwei];
    dingweiView.frame = CGRectMake(290, 170, 32, 32);
    [self.view addSubview:dingweiView];
    
    UILabel *wei = [[UILabel alloc] init];
    wei.text = @"陕西省，西安市";
    wei.frame = CGRectMake(330, 170, 95, 32);
    wei.backgroundColor = _goodColor;
    wei.font = [UIFont systemFontOfSize:12];
    [wei.layer setMasksToBounds:YES];
    [wei.layer setCornerRadius:10];
    wei.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:wei];
    
}

- (void)photoWall:(UIButton*)button {
    PhotoWallViewController* photoWall = [[PhotoWallViewController alloc] init];
     
    //创建代理，执行换头像的方法，即有代理协议的类的代理为现在的视图，就能获取到传过来的值
    photoWall.delegate = self;
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:photoWall];
    
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
}


- (void)pressButton:(UIButton*)button {
    if (button.tag > 100) {
        button.backgroundColor = _goodColor;
        button.tag -= 10;
        button.tintColor = [UIColor whiteColor];
    } else {
        button.backgroundColor = [UIColor whiteColor];
        button.tag += 10;
        button.tintColor = [UIColor blackColor];
    }
}

- (void)pressRelease:(UIButton*)button {
    UIAlertController *tips = [UIAlertController alertControllerWithTitle:@"提示" message:@"您已成功发布" preferredStyle:UIAlertControllerStyleAlert];
    [tips addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:tips animated:YES completion:nil];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(0, -50, width, height);
    }];
    [UIView setAnimationsEnabled:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(0, 0, width, height);
    }];
    [UIView setAnimationsEnabled:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_titleText resignFirstResponder];
    [_describeText resignFirstResponder];
}

- (void)pressBack:(UIButton*)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)noDownload:(UIButton*)button {
    if (button.tag == 857) {
        UIImage *image = [UIImage imageNamed:@"download.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.tag = 1;
        button.tag = 957;
        imageView.frame = CGRectMake(5, 12, 15, 15);
        [imageView.layer setMasksToBounds:YES];
        [imageView.layer setCornerRadius:5.0];
        [button addSubview:imageView];
    } else {
        for (UIImageView *view in button.subviews) {
            if (view.tag == 1) {
                [view removeFromSuperview];
            }
        }
        button.tag = 857;
    }
}

- (void)changePhoto:(NSMutableArray *)imageArray {
    //全局的UILabel，进来就判断其tag值，为1就清除
    if (_quantity.tag == 1) {
        [_quantity removeFromSuperview];
    }
    
    //改头像
    UIButton* button = imageArray[0];
    NSString *imageName = [[NSString alloc] initWithFormat:@"upload%ld.png", button.tag - 1];
    NSInteger sum = imageArray.count;
    [_photoButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    //加个数
    NSString* number = [[NSString alloc] initWithFormat:@"%ld", sum];
    _quantity = [[UILabel alloc] init];
    _quantity.text = number;
    _quantity.textColor = [UIColor redColor];
    _quantity.tag = 1;
    _quantity.frame = CGRectMake(230, 3, 18, 18);
    [_photoButton addSubview:_quantity];
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
