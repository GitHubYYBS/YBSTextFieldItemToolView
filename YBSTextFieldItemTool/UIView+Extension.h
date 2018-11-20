//
//  UIView+Extension.h
//  BlackGold
//
//  Created by Beyondream on 2017/6/5.
//  Copyright © 2017年 Beyondream. All rights reserved.

#import <UIKit/UIKit.h>


@interface UIView (Extension)
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic) CGFloat left; ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top; ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right; ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom; ///< Shortcut for frame.origin.y + frame.size.height




typedef NS_ENUM(NSInteger,YBSLayoutCornerRadiusType) {
    YBSLayoutCornerRadiusTop = 0,
    YBSLayoutCornerRadiusLeft = 1,
    YBSLayoutCornerRadiusBottom = 2,
    YBSLayoutCornerRadiusRight = 3,
    YBSLayoutCornerRadiusAll = 4,
    YBSLayoutCornerdeleteTopleft = 5,
    YBSLayoutCornerdeleteTopRight = 6,
};


/**
 配置圆角

 @param radiusType 圆角位置
 @param cornerRadius 圆角大小
 */
-(void)ybs_LayoutCornerRadiusType:(YBSLayoutCornerRadiusType )radiusType withCornerRadius:(CGFloat)cornerRadius;














@end
