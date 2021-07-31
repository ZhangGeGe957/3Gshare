//
//  PhotoWallViewController.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/27.
//

#import "PhotoWallViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface PhotoWallViewController ()

@end

@implementation PhotoWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageArray = [[NSMutableArray alloc] init];
    self.title = @"选择图片";
    
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(pressSure:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    rightButton.tintColor = [UIColor blackColor];
    
    UIBarButtonItem* leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressReturn:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    leftButton.tintColor = [UIColor blackColor];
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _scrollView.contentSize = CGSizeMake(width, height);
    _scrollView.scrollEnabled = YES;
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollView];
    
    int sum = 1;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            NSString* imageName = [[NSString alloc] initWithFormat:@"do%d.png", sum];
            _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_selectButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            [_selectButton addTarget:self action:@selector(selectSure:) forControlEvents:UIControlEventTouchUpInside];
            _selectButton.frame = CGRectMake(10 + 210 * j, 120 * i, 198, 100);
            //改变文字和图像的位置关系 UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
            [_selectButton setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 0, 0)];
            //设置圆角
            [_selectButton.layer setMasksToBounds:YES];
            [_selectButton.layer setCornerRadius:5.0];
            _selectButton.tag = 101 + sum;
            [_scrollView addSubview:_selectButton];
            sum++;
        }
    }
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)pressSure:(UIBarButtonItem*)rightButton {
    if (_imageArray.count > 0) {
        for (UIButton *button in _imageArray) {
            if (button.tag == 857) {
                [_imageArray removeObject:button];
            }
        }
        UIAlertController* tipView = [UIAlertController alertControllerWithTitle:@"提示" message:@"上传成功" preferredStyle:UIAlertControllerStyleAlert];
        [tipView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:tipView animated:true completion:nil];
        //完成代理，调用代理函数
        [_delegate changePhoto:_imageArray];
        
    } else {
        //创建警告对话框
        UIAlertController* warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"您没有选择要上传的图片，请重新选择您需要上传的图片" preferredStyle:UIAlertControllerStyleAlert];
        //点击按钮响应事件
        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:warning animated:YES completion:nil];
    }
}

- (void)pressReturn:(UIBarButtonItem*)leftButton {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)selectSure:(UIButton*)selectButton {
    if (selectButton.tag > 100) {
        UIImage* image = [UIImage imageNamed:@"download.png"];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.tag = 1;
        imageView.frame = CGRectMake(180, 10, 16, 16);
        selectButton.tag -= 100;
        [_imageArray addObject:selectButton];
        [selectButton addSubview:imageView];
    } else {
        for (UIImageView *view in selectButton.subviews) {
            if (view.tag == 1) {
                [view removeFromSuperview];
            }
        }
        [_imageArray removeObject:selectButton];
        selectButton.tag += 100;
    }
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
