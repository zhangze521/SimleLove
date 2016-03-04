//
//  ZhouQiViewController.m
//  SimpleLoveAPP
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 张泽. All rights reserved.
//

#import "ZhouQiViewController.h"
#import "YiMaViewController.h"
@interface ZhouQiViewController ()
//姨妈光临时间
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;
//持续几天
@property (weak, nonatomic) IBOutlet UITextField *DaysTextF;
//时间选择器属性
@property (weak, nonatomic) IBOutlet UIDatePicker *DatePicker;
//最后得出新的时间
@property(nonatomic,strong)NSString *resultDate;
@end

@implementation ZhouQiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.DateLabel.text = [defaults objectForKey:@"lastDate"];
    self.DaysTextF.text = [defaults objectForKey:@"zhouqiDate"];
}
//时间选择器

- (IBAction)click:(UIDatePicker *)sender {
    //获取用户通过UIDatePicker设置的日期和时间
    NSDate *selected = [self.DatePicker date];
    
    //创建一个日期格式器
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //为日期格式器设置格式字符串
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
     
     //使用日期格式器格式化日期、时间
     NSString *destDateString = [dateFormatter stringFromDate:selected];
     
     NSString *message =  [NSString stringWithFormat:@"%@",destDateString];
    
    //显示在 label 上
    self.DateLabel.text  = message;

}

//右上角完成按钮
- (IBAction)DoneAction:(UIBarButtonItem *)sender {
   
    int addDays = [self.DaysTextF.text intValue];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate *myDate = [dateFormatter dateFromString:self.DateLabel.text];
    //下次来的时候日期
    NSDate *newDate = [myDate dateByAddingTimeInterval:60 * 60 * 24 * addDays];
    NSString *NextDateStr = [dateFormatter stringFromDate:newDate];
    NSLog(@"%@",NextDateStr);
    self.resultDate = NextDateStr;
    
    //数据持久化
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:self.DateLabel.text forKey:@"lastDate"];
    [user setObject:self.DaysTextF.text forKey:@"zhouqiDate"];
    [user setObject:self.resultDate forKey:@"nextDate"];
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
