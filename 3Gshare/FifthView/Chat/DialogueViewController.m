//
//  DialogueViewController.m
//  3Gshare
//
//  Created by 张佳乔 on 2021/7/28.
//

#import "DialogueViewController.h"
#import "ChatTableViewCell.h"

#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height

@interface DialogueViewController ()

@end

@implementation DialogueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _goodColor = [UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1];
    
    _arryright = [[NSMutableArray alloc]initWithObjects:@"你拍的真不错",@"好专业的照片，非常喜欢这种风格，期待你更好的作品", nil];
        _arryM = [[NSMutableArray alloc]initWithObjects:@"谢谢，已关注你",@"嗯嗯，好的", nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _falseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, widt, 100)];
    [self.view addSubview:_falseView];
    UIImage *falseImage = [UIImage imageNamed:@"background_main.png"];
    UIImageView *falseImageView = [[UIImageView alloc] initWithImage:falseImage];
    falseImageView.frame = CGRectMake(0, 0, widt, 100);
    [_falseView addSubview:falseImageView];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    _backButton.frame = CGRectMake(20, 40, 50, 50);
    [_backButton addTarget:self action:@selector(pressBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"share小兰";
    title.frame = CGRectMake(155, 30, 150, 70);
    title.font = [UIFont systemFontOfSize:28];
    title.textColor = [UIColor whiteColor];
    [_falseView addSubview:title];
    
//---------------------------------------------------------------------------
    _arryleftsizewidh = [[NSMutableArray alloc]init];
    _arryrightsizewidh = [[NSMutableArray alloc]init];
    _arryleftsizeheight = [[NSMutableArray alloc]init];
    _arryrightsizeheight = [[NSMutableArray alloc]init];
    
    for (NSString * str in _arryright) {
            CGSize sizeright = [self size:str font:[UIFont systemFontOfSize:14.0] maxSize:CGSizeMake(375/2-70 , MAXFLOAT)];
            
            NSNumber *num = [NSNumber numberWithFloat:sizeright.width];
            NSNumber *num1 = [NSNumber numberWithFloat:sizeright.height];
            [_arryrightsizeheight addObject:num1];
            [_arryrightsizewidh addObject:num];
        }
        for (NSString * str in _arryM) {
            CGSize sizeleft = [self size:str font:[UIFont systemFontOfSize:14.0] maxSize:CGSizeMake(372/2-70, MAXFLOAT)];
            NSNumber *num = [NSNumber numberWithFloat:sizeleft.width];
            NSNumber *num1 = [NSNumber numberWithFloat:sizeleft.height];
            [_arryleftsizeheight addObject:num1];
            [_arryleftsizewidh addObject:num];
            _shuruTextField.delegate = self;
        }
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, heigh - 200) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[ChatTableViewCell class] forCellReuseIdentifier:@"chat"];
    
    _shuruTextField.delegate = self;
    _shuruTextField = [[UITextField alloc]initWithFrame:CGRectMake(30, heigh - 90, 290, 40)];
    [self.view addSubview:_shuruTextField];
    _shuruTextField.keyboardType = UIKeyboardTypeDefault;
    _shuruTextField.borderStyle = UITextBorderStyleRoundedRect;
    _shuruTextField.backgroundColor = [UIColor whiteColor];
    
    _sendButton = [[UIButton alloc]initWithFrame:CGRectMake(340, heigh - 85, 60, 30)];
    [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [_sendButton addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    [_sendButton setTintColor:[UIColor whiteColor]];
    _sendButton.backgroundColor = _goodColor;
    [self.view addSubview:_sendButton];
    [_sendButton.layer setMasksToBounds:YES];
    [_sendButton.layer setCornerRadius:5.0];
    
}

-(CGSize)size:(NSString*)text font:(UIFont*)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName ,nil];
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

-(void)send {
    [_arryM addObject:_shuruTextField.text];
    [_arryright addObject:_shuruTextField.text];

    CGSize sizeright = [self size:_shuruTextField.text font:[UIFont systemFontOfSize:14.0] maxSize:CGSizeMake(375 / 2 - 70 , MAXFLOAT)];

    NSNumber *num = [NSNumber numberWithFloat:sizeright.width];
    NSNumber *num1 = [NSNumber numberWithFloat:sizeright.height];
    [_arryrightsizeheight addObject:num1];
    [_arryrightsizewidh addObject:num];


    CGSize sizeleft = [self size:_shuruTextField.text font:[UIFont systemFontOfSize:14.0] maxSize:CGSizeMake(372/2-70, MAXFLOAT)];
    NSNumber *num3 = [NSNumber numberWithFloat:sizeleft.width];
    NSNumber *num4 = [NSNumber numberWithFloat:sizeleft.height];
    [_arryleftsizeheight addObject:num4];
    [_arryleftsizewidh addObject:num3];
    NSLog(@"%@",_arryleftsizeheight[2]);
    NSLog(@"%@",_arryM[2]);
    _shuruTextField.text = @"";
    [_tableView reloadData];
    
    
    if (_arryM.count > 6) {
        NSLog(@"%lf",_tableView.sectionFooterHeight);
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:_arryM.count - 1]
                                            animated:YES
                                      scrollPosition:UITableViewScrollPositionMiddle];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"chat" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //每一个cell的计算就是从右开始布局然后在右的基础上进行增加高度和宽度
    cell.dateLabel.frame = CGRectMake(160, 5, 200, 10) ;
    NSDate *date =[NSDate date];//获取时间
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    NSString *sDate = [format stringFromDate:date];
    cell.dateLabel.text = sDate;
    cell.dateLabel.textColor = [UIColor blackColor];
    cell.dateLabel.font = [UIFont systemFontOfSize:10];
    
    CGSize textSizeright;
    textSizeright.height =[_arryrightsizeheight[indexPath.section] floatValue];
    textSizeright.width = [_arryrightsizewidh[indexPath.section] floatValue];
    CGSize textSizeleft;
    textSizeleft.height =[_arryleftsizeheight[indexPath.section] floatValue];
    textSizeleft.width = [_arryleftsizewidh[indexPath.section] floatValue];
    
    cell.rightImageView.image = [UIImage imageNamed:@"19-2.jpeg"];
    cell.rightImageView.frame = CGRectMake(widt - 50, 25, 40, 40);
    cell.rightTextView.text = _arryright[indexPath.section];
    cell.rightTextView.frame = CGRectMake(250, 25, textSizeright.width, textSizeright.height);
    cell.rightTextView.numberOfLines = 0;
    cell.rightTextView.font = [UIFont systemFontOfSize:14.0];
    
    cell.leftImageView.frame = CGRectMake(10, textSizeright.height + 45, 40, 40);
    cell.leftImageView.image = [UIImage imageNamed:@"19-1.jpeg"];
    cell.leftTextView.text = _arryM[indexPath.section];
    cell.leftTextView.frame = CGRectMake(60, textSizeright.height + 50, textSizeleft.width, textSizeleft.height);
    cell.leftTextView.numberOfLines = 0;
    cell.leftTextView.font = [UIFont systemFontOfSize:14.0];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//每一个单元格的高度计算就是获取存储CGSize数组的高度加上固定行高进行计算
    CGSize right;
    right.height = [_arryrightsizeheight[indexPath.section] floatValue];
    CGSize left;
    left.height = [_arryleftsizeheight[indexPath.section] floatValue];
    return (left.height + right.height + 80);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //这里返回的section就是数组内存储的个数
    return _arryM.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

//组间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

//脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_shuruTextField endEditing:YES];
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
