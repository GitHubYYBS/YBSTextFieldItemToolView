//
//  YBSTextFieldItemTextField.h
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/9/9.
//  Copyright © 2018年 陈樟权. All rights reserved.
//  输入框

#import <UIKit/UIKit.h>


@class YBSTextFieldItemTextField;
@protocol YBSBaseTextFieldDelegate <NSObject>

@optional

/// 监听 键盘 删除按钮的点击事件 -> 删除内容之后调用
- (void)ybs_clickCancelBaseTextField:(YBSTextFieldItemTextField *)textField;

@end

static CGFloat const ybs_texFieldTextFont = 14;


@interface YBSTextFieldItemTextField : UITextField

@property (nonatomic, weak) id ybs_baseTextFieldDelegate;



@end
