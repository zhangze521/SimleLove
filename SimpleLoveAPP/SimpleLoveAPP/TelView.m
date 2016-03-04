//
//  TelView.m
//  SimpleLoveAPP
//
//  Created by lanou3g on 16/3/1.
//  Copyright © 2016年 张泽. All rights reserved.
//

#import "TelView.h"

@implementation TelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self allViews];
    }
    return self;
}

-(void)allViews{
    self.backgroundColor = [UIColor grayColor];
    
    self.telFeield = [[UITextField alloc]initWithFrame: CGRectMake([UIScreen mainScreen].bounds.size.width/2-100, [UIScreen mainScreen].bounds.size.height/2-80, 200, 30)];
    self.telFeield.placeholder = @"输入亲爱的手机号";
    self.telFeield.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.telFeield];
    
    self.SaveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.SaveBtn.frame = CGRectMake(self.telFeield.frame.origin.x +65, self.telFeield.frame.origin.y+80, 70, 30);
    self.SaveBtn.backgroundColor = [UIColor redColor];
    self.SaveBtn.titleLabel.text = @"保存";
    [self addSubview:self.SaveBtn];
}

@end
