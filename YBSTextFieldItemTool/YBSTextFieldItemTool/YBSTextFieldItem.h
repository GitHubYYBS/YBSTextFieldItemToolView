//
//  YBSTextFieldItem.h
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/9/9.
//  Copyright © 2018年 陈樟权. All rights reserved.
//  配置模型

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, YBSKeyboardStype) { // 键盘状态
    
    YBSKeyboardStypeWillShow = 1, // 即将出现
    YBSKeyboardStypeWillHide = 2 // 即将隐藏
};

@class YBSTextFieldItemTextField;
@interface YBSTextFieldItem : NSObject



/// 底部View背景颜色 ->默认:白色
@property (nonatomic, strong) UIColor *ybs_bagViewColor;
/// 输入框 左侧 icon
@property (nonatomic, strong) UIImage *ybs_textFLeftIconImage;
/// 最左及最右的边距 (如:输入框左侧icon 左边距离) -> 默认25
@property (nonatomic, assign) CGFloat ybs_bagViewSubLeftAndRightDistanceFloat;
/// 底部View 最下方 是否划线 -> 左右间距 会依据 ybs_bagViewSubLeftAndRightDistanceFloat 来配置 默认:没有该线
@property (nonatomic, assign, getter=isybs_neetBottomLineBool) BOOL ybs_neetBottomLineBool;
/// 底部View 最下方 线的颜色 ->默认 #DDDDDD
@property (nonatomic, strong) UIColor *ybs_bottomLineViewColor;
/// 输入框 右侧 按钮Nor图片 -> 只有在该值 或者 ybs_rightBtnTitleStr 二者配置其中一个 右侧的按钮才会布局 否则不布局
@property (nonatomic, strong) UIImage *ybs_rightBtnNorImage;
/// 输入框 右侧 按钮Sel图片 -> 只有在该值 或者 ybs_rightBtnTitleStr 二者配置其中一个 右侧的按钮才会布局 否则不布局
@property (nonatomic, strong) UIImage *ybs_rightBtnSelImage;
/// 输入框 右侧 按钮标题 -> 只有在该值 或者 ybs_rightBtnImage 二者配置其中一个 右侧的按钮才会布局 否则不布局
@property (nonatomic, strong) NSString *ybs_rightBtnTitleStr;
/// 输入框 右侧 按钮标题字体大小 -> 默认: 14
@property (nonatomic, strong) UIFont *ybs_rightBtnTitleFont;
/// 输入框 右侧 按钮标题字体颜色 -> 默认: #D9081F (红)
@property (nonatomic, strong) UIColor *ybs_rightBtnTitleColor;
/// 输入框 右侧 按钮宽度 -> 默认: 是一个正方形 高度 == 底部View高度 - 底部线的高度
@property (nonatomic, assign) CGFloat ybs_rightBtnWidthFloat;
/// 输入框 右侧 按钮 点击事件
@property (nonatomic, copy) void(^ybs_clickRightBtnBlock)(YBSTextFieldItemTextField *textF, UIButton *rightBtn);
/// 输入框与左侧icon的间距 ->默认: 15
@property (nonatomic, assign) CGFloat ybs_iconAndTextFDistanceFloat;
/// 键盘类型 -> default is UIKeyboardTypeDefault
@property(nonatomic, assign) UIKeyboardType ybs_keyboardType;
/// 输入框没有输入时的提示语
@property (nonatomic, strong) NSString *ybs_placeholder;
///// 输入框默认值 ->该值被赋值时 才会显示
//@property (nonatomic, strong) NSString *ybs_defaultStr;
/// 输入框 字体大小 ->默认: 17
@property (nonatomic, strong) UIFont *ybs_textFieldFont;
/// 输入框 Done 的类型 ->默认: UIReturnKeyDefault
@property(nonatomic, assign) UIReturnKeyType ybs_returnKeyType;                       // default is UIReturnKeyDefault (See note under UIReturnKeyType enum)
/// 输入框 文字对齐方式
@property(nonatomic, assign) NSTextAlignment ybs_textAlignment;        // default is NSLeftTextAlignment
/// 输入框 输入文本是否加密 ->默认: NO 不加密
@property(nonatomic,assign,getter=isybs_SecureTextEntry) BOOL ybs_secureTextEntry;       // default is NO
/// 输入框 允许输入的字符 ->默认所有的都可以输入 如果该值有值 则只允许输入 该值范围内的 如手机号时 该值因该为 "0123456789"
@property (nonatomic, strong) NSString *ybs_allowImportStr;
/// 输入框 首字符校验 首字符只允许输入该值 如 ybs_firstImportStr = @"1" 则第一只允许输入 1 
@property (nonatomic, strong) NSString *ybs_firstImportStr;
/// 输入框 需要被隔开的位置集合 如: 188 5601 2536 ybs_blankLocationArray = @[3, 7] (第3位后和 第7位后 加空格)
@property (nonatomic, strong) NSArray *ybs_blankLocationArray;
/// 输入框 输入字符最大长度 控制(需要的空格补位不记入) 如: 188 5264 2568 ybs_maxLengthInteger = 11 就好了
@property (nonatomic, assign) NSInteger ybs_maxLengthInteger;
/// 输入框 输入内容 实时回调 notFormatStr ->没有格式的字符串 18825362546 formatStr有格式的 188 1524 1542 (formatStr->只在ybs_blankLocationArray有值时才会是格式好的样子,否则与notFormatStr相同)
@property (nonatomic, copy) void(^ybs_textFieldDidChangeBlock)(NSString *notFormatStr, NSString *formatStr);
/// 是否允许输入 默认允许 如果为No则该输入框不允许输入
@property (nonatomic, assign,getter=isybs_allowImportBool) BOOL ybs_allowImportBool;
/// 即将进入输入时的回调 ->其目的是有时候 我们不需要输入只是需要这个输入框
@property (nonatomic, copy) void(^ybs_textFieldShouldBeginEditingBlock)(YBSTextFieldItemTextField *textF);
/// 是否显示 大小写 default is UITextAutocapitalizationTypeSentences
@property (nonatomic, assign) UITextAutocapitalizationType ybs_autocapitalizationType;
/// 设置右侧的clear Button 什么时候显示 sets when the clear button shows up. default is UITextFieldViewModeNever
@property(nonatomic, assign) UITextFieldViewMode  ybs_clearButtonMode;

/// 键盘状态回调
@property (nonatomic, copy) void(^ybs_KeyboardFrameDidChangeBlock)(YBSTextFieldItemTextField *textF,YBSKeyboardStype stype, CGRect keyboardRect);



;


@end
