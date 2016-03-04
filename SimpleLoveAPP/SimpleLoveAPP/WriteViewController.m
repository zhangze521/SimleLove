//
//  WriteViewController.m
//  SimpleLoveAPP
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 张泽. All rights reserved.
//

#import "WriteViewController.h"

@interface WriteViewController ()
@property (weak, nonatomic) IBOutlet UILabel *NowDateTime;
@property (weak, nonatomic) IBOutlet UITextView *writeTextV;

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取当前时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    self.NowDateTime.text = dateTime;
    self.writeTextV.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor grayColor]);
    self.writeTextV.layer.cornerRadius = 20;
    self.writeTextV.layer.borderColor = UIColor.grayColor.CGColor;
    self.writeTextV.layer.borderWidth = 1;
    self.writeTextV.layer.cornerRadius = 6;
    self.writeTextV.layer.masksToBounds = YES;
}
- (IBAction)BtnDoneAction:(UIBarButtonItem *)sender {
    //不能再编辑
    self.writeTextV.editable = NO;
    NSLog(@"aaa");
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
