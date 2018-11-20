//
//  YBSTextFieldItemToolView.h
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/9/9.
//  Copyright © 2018年 陈樟权. All rights reserved.
//  控件

#import <UIKit/UIKit.h>
#import "YBSTextFieldItem.h"
#import "YBSTextFieldItemTextField.h"

@interface YBSTextFieldItemToolView : UIView

/// <# 请输入注释 #>
@property (nonatomic, weak) YBSTextFieldItemTextField *textF;


/**
 初始化

 @param frame frame
 @param conItem 配置模型_该输入配置参数都在该模型中配置
 @return 返回
 */
+ (instancetype)ybs_textFieldItemToolViewWithFrame:(CGRect )frame configurationItem:(YBSTextFieldItem *)conItem;


/// 需要重新输入 会将输入框所有的东西置空
- (void)ybs_neetToImportAgain;

@end
