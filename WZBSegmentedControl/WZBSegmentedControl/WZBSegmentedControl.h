//
//  WZBSegmentedControl.h
//  WZBSegmentedControl
//
//  Created by normal on 2016/11/8.
//  Copyright © 2016年 WZB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZBSegmentedControl : UIView

+ (instancetype)segmentWithFrame:(CGRect)frame titles:(NSArray *)titles titleClick:(void(^)(NSInteger index))titleClick;
- (void)setContentOffset:(CGPoint)contentOffset;
@end
