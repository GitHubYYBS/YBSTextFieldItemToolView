//
//  YBSTextFieldItemTextField.m
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/9/9.
//  Copyright © 2018年 陈樟权. All rights reserved.
//

#import "YBSTextFieldItemTextField.h"

@implementation YBSTextFieldItemTextField

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = true;
        self.font = [UIFont systemFontOfSize:ybs_texFieldTextFont];
        self.tintColor = [UIColor colorWithRed:255 / 255 green:62 /255 blue:77 / 255 alpha:1];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.keyboardAppearance = UIKeyboardAppearanceLight;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    // 只有 键盘类型 暗文提示文字 没有做统一设置
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = true;
        self.tintColor = [UIColor colorWithRed:255 / 255 green:62 /255 blue:77 / 255 alpha:1];
        self.font = [UIFont systemFontOfSize:ybs_texFieldTextFont];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.keyboardAppearance = UIKeyboardAppearanceLight;
        
    }
    
    return self;
}



- (void)deleteBackward{
    [super deleteBackward];
    
    if ([self.ybs_baseTextFieldDelegate respondsToSelector:@selector(ybs_clickCancelBaseTextField:)]) {
        [self.ybs_baseTextFieldDelegate ybs_clickCancelBaseTextField:self];
    }
}

@end
