//
//  ChatListViewController.m
//  SimpleLoveAPP
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 刘润东. All rights reserved.
//

#import "ChatListViewController.h"
#import <RongIMKit/RCConversationViewController.h>
//融云Token
#define RongYunToken @"TuRY88qEci+UK49SnXxMtTpnMqUNLv5EoBYsrYmfQDR6kCwLXb31BvvdwWPmlLz4B7mcxkS/qj83b2Zec4LebA=="
@interface ChatListViewController ()<RCIMUserInfoDataSource>

@end

@implementation ChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Do any additional setup after loading the view.
}

- (IBAction)chat:(UIBarButtonItem *)sender {
    NSString *token  = RongYunToken;
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        [[RCIM sharedRCIM]setUserInfoDataSource:self];
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            ChatListViewController *chatListVC= [[ChatListViewController alloc]init];
            [self.navigationController pushViewController:chatListVC animated:YES];
        });
        
        
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];

    
    
}

#pragma  mark --  提供给融云用户的信息 
-(void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion{
    //此处延时一个用户信息
    if ([@"test1"isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"test1";
        user.name = @"测试者1";
        user.portraitUri = @"http://img1.imgtn.bdimg.com/it/u=798549561,3387527482&fm=21&gp=0.jpg";
        return completion(user);
        
    }else if([@"2"isEqual:userId]){
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId= @"2";
        user.name = @"测试者2";
        user.portraitUri =@"http://img2.dwstatic.com/lol/1601/317642425546/317642824585.jpg";
        return completion(user);
    }
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
