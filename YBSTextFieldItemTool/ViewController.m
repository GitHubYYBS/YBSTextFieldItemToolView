//
//  ViewController.m
//  YBSTextFieldItemTool
//
//  Created by 严兵胜 on 2018/11/20.
//  Copyright © 2018年 严兵胜. All rights reserved.
//

#import "ViewController.h"

#import "UIView+Extension.h"
#import "YBSTextFieldItemToolView.h"



@interface ViewController ()

/// <# 请输入注释 #>
@property (nonatomic, weak) UILabel *restPhoneLable;
/// <# 请输入注释 #>
@property (nonatomic, weak) UILabel *restIDCardLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    UILabel *phoneTiShiLable = [UILabel new];
    phoneTiShiLable.numberOfLines = 0;
    phoneTiShiLable.textAlignment = NSTextAlignmentCenter;
    phoneTiShiLable.text = @"手机号演示 \n限制首位只能输入1,长度,以及空格格式化";
    phoneTiShiLable.width = self.view.width;
    [phoneTiShiLable sizeToFit];
    phoneTiShiLable.width = self.view.width;
    phoneTiShiLable.centerX = self.view.width * 0.5;
    phoneTiShiLable.top = 100;
    [self.view addSubview:phoneTiShiLable];
    
    // 手机号输入框
    YBSTextFieldItem *phoneItem = [YBSTextFieldItem new];
    phoneItem.ybs_textFLeftIconImage = [UIImage imageNamed:@"login_phoneIcon_image"];
    phoneItem.ybs_neetBottomLineBool = true;
    phoneItem.ybs_placeholder = @"请输入您的手机号码";
    phoneItem.ybs_keyboardType = UIKeyboardTypeNumberPad;
    phoneItem.ybs_bagViewSubLeftAndRightDistanceFloat = 23;
    phoneItem.ybs_allowImportStr = @"0123456789";
    phoneItem.ybs_firstImportStr = @"1";
    phoneItem.ybs_blankLocationArray = @[@(3), @(7)];
    phoneItem.ybs_maxLengthInteger = 11;
    phoneItem.ybs_textFieldDidChangeBlock = ^(NSString *notFormatStr, NSString *formatStr) {
        NSLog(@"手机号_实时回调__没有格式->%@__有格式->%@",notFormatStr,formatStr);
        weakSelf.restPhoneLable.text = [NSString stringWithFormat:@"手机号:%@/%@",formatStr,notFormatStr];
    };
    YBSTextFieldItemToolView *phoneView = [YBSTextFieldItemToolView ybs_textFieldItemToolViewWithFrame:CGRectMake(0,CGRectGetMaxY(phoneTiShiLable.frame) + 20,self.view.bounds.size.width, 45) configurationItem:phoneItem];
    [self.view addSubview:phoneView];
    
    
    UILabel *IDCardTiShiLable = [UILabel new];
    IDCardTiShiLable.numberOfLines = 0;
    IDCardTiShiLable.textAlignment = NSTextAlignmentCenter;
    IDCardTiShiLable.text = @"身份证号演示 \n限制长度,允许输入的字符,以及空格格式化";
    IDCardTiShiLable.width = self.view.width;
    [IDCardTiShiLable sizeToFit];
    IDCardTiShiLable.width = self.view.width;
    IDCardTiShiLable.centerX = self.view.width * 0.5;
    IDCardTiShiLable.top = CGRectGetMaxY(phoneView.frame) + 50;
    [self.view addSubview:IDCardTiShiLable];
    
    // 身份证号
    YBSTextFieldItem *IDCardItem = [YBSTextFieldItem new];
    IDCardItem.ybs_neetBottomLineBool = true;
    IDCardItem.ybs_placeholder = @"请输入您的身份证号码";
    IDCardItem.ybs_keyboardType = UIKeyboardTypeDefault;
    IDCardItem.ybs_bagViewSubLeftAndRightDistanceFloat = 23;
    IDCardItem.ybs_allowImportStr = @"0123456789Xx";
    IDCardItem.ybs_blankLocationArray = @[@(6), @(10), @(14)];
    IDCardItem.ybs_maxLengthInteger = 18;
    IDCardItem.ybs_textFieldDidChangeBlock = ^(NSString *notFormatStr, NSString *formatStr) {
        NSLog(@"身份证号_实时回调__没有格式->%@__有格式->%@",notFormatStr,formatStr);
        weakSelf.restIDCardLable.text = [NSString stringWithFormat:@"身份证号:%@/%@",formatStr,notFormatStr];

    };
    YBSTextFieldItemToolView *IDCardView = [YBSTextFieldItemToolView ybs_textFieldItemToolViewWithFrame:CGRectMake(0, CGRectGetMaxY(IDCardTiShiLable.frame) + 20,self.view.bounds.size.width, 45) configurationItem:IDCardItem];
    [self.view addSubview:IDCardView];
    
    
    
    
    UILabel *restPhoneLable = [UILabel new];
    restPhoneLable.font = [UIFont systemFontOfSize:13];
    restPhoneLable.frame = CGRectMake(10, CGRectGetMaxY(IDCardView.frame) + 50, self.view.width, 15);
    [self.view addSubview:_restPhoneLable = restPhoneLable];
    
    UILabel *restIDCardLable = [UILabel new];
    restIDCardLable.font = [UIFont systemFontOfSize:13];
    restIDCardLable.frame = CGRectMake(10, CGRectGetMaxY(restPhoneLable.frame) + 10, self.view.width, 15);
    [self.view addSubview:_restIDCardLable = restIDCardLable];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
