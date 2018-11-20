//
//  YBSTextFieldItemToolView.m
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/9/9.
//  Copyright © 2018年 陈樟权. All rights reserved.
//

#import "YBSTextFieldItemToolView.h"

#import "YBSTextFieldItem.h"
#import "YBSTextFieldItemTextField.h"
#import "UIView+Extension.h"

/**  尺寸 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

static CGFloat const ybs_bagViewSubLeftAndRightDistanceFloat = 25; // 最左及最右的边距 (如:输入框左侧icon 左边距离) -> 默认25
static NSString *const ybs_rightBtnTitleColor = @"D9081F"; // 输入框 右侧 按钮标题字体颜色 -> 默认: #D9081F (红)
static CGFloat const ybs_iconAndTextFDistanceFloat = 15; // 输入框与左侧icon的间距 ->默认: 15
static CGFloat const ybs_textFieldFontFloat = 17; // 输入框 字体大小 ->默认: 17
static NSString *const ybs_blank = @"  "; // 站位空格


@interface YBSTextFieldItemToolView ()<UITextFieldDelegate, YBSBaseTextFieldDelegate>

/// 配置模型
@property (nonatomic, strong) YBSTextFieldItem *conItem;

/// 下一个空格位置 从ybs_blankLocationArray 中取值
@property (nonatomic, assign) NSInteger nextBlankLocationInteger;
/// 当前检索位置 针对 ybs_blankLocationArray 中的元素而言
@property (nonatomic, assign) NSInteger curBlankLocationArrayIndex;
@end

@implementation YBSTextFieldItemToolView

+ (instancetype)ybs_textFieldItemToolViewWithFrame:(CGRect )frame configurationItem:(YBSTextFieldItem *)conItem{
    
    YBSTextFieldItemToolView *bagView = [[YBSTextFieldItemToolView alloc] initWithFrame:frame];
    bagView.backgroundColor = (conItem.ybs_bagViewColor != nil)? conItem.ybs_bagViewColor : [UIColor whiteColor];
    bagView.conItem = conItem;
    if (conItem.ybs_blankLocationArray.count) bagView.nextBlankLocationInteger = [conItem.ybs_blankLocationArray[bagView.curBlankLocationArrayIndex] integerValue];
    
    // 底部的线
    UIView *bottomLineView = [UIView new];
    bottomLineView.backgroundColor = (conItem.ybs_bottomLineViewColor != nil)? conItem.ybs_bottomLineViewColor : [UIColor colorWithRed:221/255 green:221/255 blue:221/255 alpha:1];
    bottomLineView.left = (conItem.ybs_bagViewSubLeftAndRightDistanceFloat > 0)? conItem.ybs_bagViewSubLeftAndRightDistanceFloat : ybs_bagViewSubLeftAndRightDistanceFloat;
    bottomLineView.width = bagView.width - 2 * bottomLineView.left;
    bottomLineView.height = (conItem.ybs_neetBottomLineBool)? 1 : 0; // 配置高度
    bottomLineView.top = bagView.height - bottomLineView.height;
    [bagView addSubview:bottomLineView];
    
    
    // 输入框左侧Icon
    UIImageView *leftIconImageView = [[UIImageView alloc] initWithImage:conItem.ybs_textFLeftIconImage];
    [leftIconImageView sizeToFit];
    leftIconImageView.left = (conItem.ybs_bagViewSubLeftAndRightDistanceFloat > 0)? conItem.ybs_bagViewSubLeftAndRightDistanceFloat : ybs_bagViewSubLeftAndRightDistanceFloat;
    leftIconImageView.centerY = (bagView.height - bottomLineView.height) * 0.5;
    [bagView addSubview:leftIconImageView];
    
    // 输入框右侧按钮
    UIButton *rightBtn = [UIButton new];
    [rightBtn setTitle:conItem.ybs_rightBtnTitleStr forState:UIControlStateNormal];
    rightBtn.titleLabel.font = (conItem.ybs_rightBtnTitleFont != nil)? conItem.ybs_rightBtnTitleFont : [UIFont systemFontOfSize:14];
    [rightBtn setImage:conItem.ybs_rightBtnSelImage forState:UIControlStateSelected];
    [rightBtn setImage:conItem.ybs_rightBtnNorImage forState:UIControlStateNormal];
    [rightBtn setTitleColor:(conItem.ybs_rightBtnTitleColor != nil)? conItem.ybs_rightBtnTitleColor : [UIColor colorWithRed:217/255 green:8/255 blue:31/255 alpha:1] forState:UIControlStateNormal];
    [rightBtn sizeToFit];
    rightBtn.height = bagView.height - bottomLineView.height;
    rightBtn.width = (conItem.ybs_rightBtnSelImage == nil && conItem.ybs_rightBtnNorImage == nil && conItem.ybs_rightBtnTitleStr.length <= 0)? 0 : ((conItem.ybs_rightBtnWidthFloat > 0)? conItem.ybs_rightBtnWidthFloat : (rightBtn.width > rightBtn.height)? rightBtn.width : rightBtn.height);
    rightBtn.right = bagView.width - bottomLineView.left;
    [bagView addSubview:rightBtn];
    [rightBtn addTarget:bagView action:@selector(clickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // 输入框
    YBSTextFieldItemTextField *textF = [YBSTextFieldItemTextField new];
    textF.keyboardType = conItem.ybs_keyboardType;
    textF.placeholder = conItem.ybs_placeholder;
    textF.secureTextEntry = conItem.ybs_secureTextEntry;
    textF.autocapitalizationType = conItem.ybs_autocapitalizationType;
    textF.clearButtonMode = conItem.ybs_clearButtonMode;
    textF.font = (conItem.ybs_textFieldFont != nil)? conItem.ybs_textFieldFont : [UIFont systemFontOfSize:ybs_textFieldFontFloat];
    textF.delegate = bagView;
    textF.ybs_baseTextFieldDelegate = bagView;
    textF.returnKeyType = conItem.ybs_returnKeyType;
    textF.ybs_baseTextFieldDelegate = bagView;
    textF.textAlignment = conItem.ybs_textAlignment;
    textF.left = leftIconImageView.right + ((conItem.ybs_iconAndTextFDistanceFloat > 0)? conItem.ybs_iconAndTextFDistanceFloat : ybs_iconAndTextFDistanceFloat);
    textF.height = bagView.height - bottomLineView.height;
    textF.width = rightBtn.left - textF.left;
    [bagView addSubview:bagView.textF = textF];
    
//    if (conItem.ybs_defaultStr.length) textF.text = conItem.ybs_defaultStr;

//    textF.backgroundColor = [UIColor wsd_RandomlyColor];
//    rightBtn.backgroundColor = [UIColor wsd_RandomlyColor];

    
    [[NSNotificationCenter defaultCenter] addObserver:bagView selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    return bagView;
}

- (void)ybs_neetToImportAgain{
    
    self.textF.text = @"";
    
    // 清空外界的数据
    if (_conItem.ybs_textFieldDidChangeBlock) _conItem.ybs_textFieldDidChangeBlock(@"", @"");
    
    [self ybs_centerBagViewBegingAnmation];
}


#pragma mark - Delegate


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (_conItem.ybs_textFieldShouldBeginEditingBlock) _conItem.ybs_textFieldShouldBeginEditingBlock((YBSTextFieldItemTextField *)textField);
    return _conItem.isybs_allowImportBool;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return false;
    }
    
    // 发现输入的是 删除键
    if (range.length == 1) return true;
    
    // 允许字符输入校验 值允许 _conItem.ybs_allowImportStr 中存在的值
    if (_conItem.ybs_allowImportStr.length > 0) {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:_conItem.ybs_allowImportStr] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL isIntegerBool = [string isEqualToString:filtered];
        if (!isIntegerBool) return false;
    }
    
    // 补空格
    // 删除空格后的字符串
    NSString *notBlankTextFTextStr = [textField.text stringByReplacingOccurrencesOfString:ybs_blank withString:@""];
    // 内容输入 range.length == 0  删除时 range.length == 1
    if (!range.length && _conItem.ybs_blankLocationArray.count  && self.curBlankLocationArrayIndex < _conItem.ybs_blankLocationArray.count && (notBlankTextFTextStr.length == self.nextBlankLocationInteger)) {
        textField.text = [textField.text stringByAppendingString:ybs_blank]; // 补空格
        if (self.curBlankLocationArrayIndex + 1 < _conItem.ybs_blankLocationArray.count){ // 不成立说明 ybs_blankLocationArray 中最后一个位置已经搞过了
            self.curBlankLocationArrayIndex += 1; // 检索向后移动一位
            self.nextBlankLocationInteger = [_conItem.ybs_blankLocationArray[self.curBlankLocationArrayIndex] integerValue];
        }
    }
    
    // 首字符校验
    if (!textField.text.length && _conItem.ybs_firstImportStr.length && (![string isEqualToString:_conItem.ybs_firstImportStr])) return false; // 首位只允许 输入 1
    
    // 最大输入长度控制
    if (_conItem.ybs_maxLengthInteger > 0 && ([notBlankTextFTextStr stringByAppendingString:string].length > _conItem.ybs_maxLengthInteger)) return false;
    
    
    // 实时返回给外界 ->这里要主动拼接一次
    if (_conItem.ybs_textFieldDidChangeBlock) _conItem.ybs_textFieldDidChangeBlock([notBlankTextFTextStr stringByAppendingString:string], [textField.text stringByAppendingString:string]);
    

    // 所有允许被改变的情况都从这里返回 yes ->必须 必须 必须
    return true;
}


- (void)ybs_clickCancelBaseTextField:(YBSTextFieldItemTextField *)textField{
    
     if ([textField.text hasSuffix:ybs_blank]) textField.text = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *notBlankTextFTextStr = [textField.text stringByReplacingOccurrencesOfString:ybs_blank withString:@""];
    
    
    
    // 实时纠正 空格位置 当字符长度 == 前一个空格位置时  我们要将 curBlankLocationArrayIndex 索引位置 以及 nextBlankLocationInteger空格位置 跟新到前一个
    if (self.curBlankLocationArrayIndex > 0 && notBlankTextFTextStr.length == [_conItem.ybs_blankLocationArray[self.curBlankLocationArrayIndex - 1] integerValue]) {
        self.curBlankLocationArrayIndex -= 1;
        if (self.curBlankLocationArrayIndex >= 0) self.nextBlankLocationInteger = [_conItem.ybs_blankLocationArray[self.curBlankLocationArrayIndex] integerValue];
    }
    
    
    // 实时返回给外界 ->这里要主动拼接一次
    if (_conItem.ybs_textFieldDidChangeBlock) _conItem.ybs_textFieldDidChangeBlock(notBlankTextFTextStr, textField.text);
    
}




#pragma mark - 点击事件

- (void)clickRightBtn:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (_conItem.ybs_clickRightBtnBlock) _conItem.ybs_clickRightBtnBlock(_textF, btn);
}


#pragma mark - 其他

//  需要重新输入时  中间 View  动画
- (void)ybs_centerBagViewBegingAnmation{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.values = @[@(-10),@(0),@(10),@(0)];
    animation.repeatCount = 5;
    animation.duration = 0.05;
    [self.layer addAnimation:animation forKey:nil];
}


// 键盘弹出会调用
- (void)keyboardWillChangeFrame:(NSNotification *)note{
    
    // 获取键盘frame
    CGRect endFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 获取键盘弹出时长
    // CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    if (_conItem.ybs_KeyboardFrameDidChangeBlock) _conItem.ybs_KeyboardFrameDidChangeBlock(self.textF, (endFrame.origin.y != SCREEN_HEIGHT)? YBSKeyboardStypeWillShow : YBSKeyboardStypeWillHide, endFrame);
}



- (void)dealloc{
    
    NSLog(@"当前输入框消失了");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

@end
