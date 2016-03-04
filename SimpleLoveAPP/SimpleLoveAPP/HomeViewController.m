//
//  HomeViewController.m
//  SimpleLoveAPP
//
//  Created by lanou3g on 16/2/29.
//  Copyright © 2016年 张泽. All rights reserved.
//

#import "HomeViewController.h"
#import "TelViewController.h"
//图片选择器遵循协议
@interface HomeViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
//声明图片选择器属性
@property(nonatomic,strong)UIImagePickerController *picker;

@property (weak, nonatomic) IBOutlet UIImageView *backPhoto;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //桌面背景图
    UIImageView *bgImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"hahaha.jpg"]]];
    bgImgView.frame = CGRectMake(0, 400,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height - 400);
    [self.view addSubview:bgImgView];
    [self.view sendSubviewToBack:bgImgView];
    
    self.picker = [[UIImagePickerController alloc]init];
    self.picker.delegate = self;
}
- (IBAction)changeBtnAction:(UIButton *)sender {
    [self photoAction:sender];
}
//发送距离点击事件
- (IBAction)SendDistanceAction:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"是否要发送当前距离" preferredStyle: UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击取消响应事件
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"发送" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击发送响应事件
        //发送到聊天页面里
    }]];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}
//一键呼叫点击事件
- (IBAction)callAction:(UIButton *)sender {
    //弹出提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"呼叫亲爱的~" preferredStyle:UIAlertControllerStyleActionSheet];
    //提示框按钮点击事件
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击取消响应事件
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"设置" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击设置电话号码响应事件
        TelViewController *tel = [[TelViewController alloc]init];
        [self.navigationController pushViewController:tel animated:YES];
    }]];
    //提示框按钮点击事件
    [alert addAction:[UIAlertAction actionWithTitle:@"呼叫" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
#pragma mark ***********************存储电话号码问题**************************
        
        //点击确定响应事件
        //打电话
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", ]]];
    }]];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}
//相册按钮点击事件
- (IBAction)photoAction:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message: nil preferredStyle: UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击取消响应事件
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击拍照响应事件
        //调用系统相机
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            self.picker.allowsEditing = YES;
            [self presentViewController:self.picker animated:YES completion:nil];
            
        } else {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Caution" message:@"Do not find camera, please select from photo!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
            
        }

    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"进入相册" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮响应事件
        //进入系统相册
        
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.picker.allowsEditing = YES;
        [self presentViewController:self.picker animated:YES completion:nil];
      
    }]];
    [self presentViewController:alert animated:YES completion:^{
        
    }];

}
#pragma mark --- 实现协议中的方法
// 已经完成选取图片时执行
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    self.backPhoto.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.picker dismissViewControllerAnimated:YES completion:nil];
    
}

// 已经取消选取时执行
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.picker dismissViewControllerAnimated:YES completion:nil];
    
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
