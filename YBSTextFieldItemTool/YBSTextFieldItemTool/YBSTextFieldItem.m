//
//  YBSTextFieldItem.m
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/9/9.
//  Copyright © 2018年 陈樟权. All rights reserved.
//

#import "YBSTextFieldItem.h"

@implementation YBSTextFieldItem

- (instancetype)init{
    
    if (self = [super init]) {
        
        // 配置默认值
        self.ybs_allowImportBool = true;
    }
    return self;
}

@end
