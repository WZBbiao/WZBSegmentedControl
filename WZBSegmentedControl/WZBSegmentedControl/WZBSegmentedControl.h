//
//  WZBSegmentedControl.h
//  WZBSegmentedControl
//
//  Created by normal on 2016/11/8.
//  Copyright © 2016年 WZB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZBSegmentedControl : UIView

// 所有title
@property (nonatomic, strong, readonly) NSArray *titles;
// 点击title的block回调
@property (nonatomic, copy) void(^titleClick)(NSInteger index);
// baise的滑块
@property (nonatomic, strong) UIView *backgroundView;
// 辅助属性,当前选中的Button
@property (nonatomic, strong) UIButton *selectButton;
// 为选中的button颜色
@property (nonatomic, strong) UIColor *normalColor;
// 选中的button颜色
@property (nonatomic, strong) UIColor *selectColor;
// 滑块颜色
@property (nonatomic, strong) UIColor *sliderColor;
// 边框颜色
@property (nonatomic, strong) UIColor *edgingColor;
// 边框颜色
@property (nonatomic, assign) CGFloat edgingWidth;

+ (instancetype)segmentWithFrame:(CGRect)frame titles:(NSArray *)titles titleClick:(void(^)(NSInteger index))titleClick;
/* 设置滑块的偏移量 */
- (void)setContentOffset:(CGPoint)contentOffset;
/* 设置文字颜色
 * normalColor:未选中的按钮文字颜色
 * selectColor:选中的按钮文字颜色
 */
- (void)setNormalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor;
/* 设置所有颜色
 * normalColor:未选中的按钮文字颜色
 * selectColor:选中的按钮文字颜色
 * sliderColor:滑块背景颜色
 * edgingColor:边框颜色
 */
- (void)setNormalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor sliderColor:(UIColor *)sliderColor edgingColor:(UIColor *)edgingColor;
/* 设置所有属性
 * normalColor:未选中的按钮文字颜色
 * selectColor:选中的按钮文字颜色
 * sliderColor:滑块背景颜色
 * edgingColor:边框颜色
 * edgingWidth:边框宽度
 */
- (void)setNormalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor sliderColor:(UIColor *)sliderColor edgingColor:(UIColor *)edgingColor edgingWidth:(CGFloat)edgingWidth;
@end
