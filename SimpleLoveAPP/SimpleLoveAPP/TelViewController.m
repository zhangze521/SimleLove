//
//  TelViewController.m
//  SimpleLoveAPP
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 张泽. All rights reserved.
//

#import "TelViewController.h"
#import "TelView.h"
@interface TelViewController ()
@property(nonatomic,strong)TelView *tv;
@property(nonatomic,assign)NSString *telStr;
@end

@implementation TelViewController
-(void)loadView{
    [super loadView];
    self.tv = [[TelView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.tv;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tv.SaveBtn addTarget:self action:@selector(SaveBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)SaveBtnAction:(UIButton *)sender{
    self.telStr = self.tv.telFeield.text;
    //NSLog(@"保存%@",self.telStr);
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
