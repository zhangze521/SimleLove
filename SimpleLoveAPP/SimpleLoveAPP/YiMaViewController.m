//
//  YiMaViewController.m
//  SimpleLoveAPP
//
//  Created by lanou3g on 16/3/2.
//  Copyright © 2016年 张泽. All rights reserved.
//

#import "YiMaViewController.h"

@interface YiMaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nextDate;

@end

@implementation YiMaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    //取出数据
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    self.nextDate.text = [user objectForKey:@"nextDate"];

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
