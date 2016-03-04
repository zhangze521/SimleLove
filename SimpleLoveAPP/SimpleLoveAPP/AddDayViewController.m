//
//  AddDayViewController.m
//  SimpleLoveAPP
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 张泽. All rights reserved.
//

#import "AddDayViewController.h"
#import "DayViewController.h"
@interface AddDayViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *changeDate;
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;

@property (weak, nonatomic) IBOutlet UITextField *contentTextF;
@end

@implementation AddDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//-(void)viewWillAppear:(BOOL)animated{
//    //取出数据
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    self.contentTextF.text = [user objectForKey:@"content"];
//    self.DateLabel.text = [user objectForKey:@"Date"];
//}
- (IBAction)click:(UIDatePicker *)sender {
    //获取用户通过UIDatePicker设置的日期和时间
    NSDate *selected = [self.changeDate date];
    
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

- (IBAction)DoneAction:(UIBarButtonItem *)sender {
    //数据持久化
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:self.contentTextF.text forKey:@"content"];
    [user setObject:self.DateLabel.text forKey:@"Date"];
    
//    if (self.contentTextF.text != nil || self.DateLabel.text != nil) {
//        DayViewController *dvc = [[DayViewController alloc]init];
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(200, 200, 200, 30)];
//        label.backgroundColor = [UIColor blackColor];
//        [dvc.view addSubview:label];
//    }
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
