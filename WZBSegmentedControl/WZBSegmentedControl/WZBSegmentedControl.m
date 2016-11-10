//
//  WZBSegmentedControl.m
//  WZBSegmentedControl
//
//  Created by normal on 2016/11/8.
//  Copyright © 2016年 WZB. All rights reserved.
//

#import "WZBSegmentedControl.h"

#define WZBButtonTag 9999
// view圆角
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]
#define WZBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface WZBSegmentedControl ()

// 所有title
@property (nonatomic, strong) NSArray *titles;
// 点击title的block回调
@property (nonatomic, copy) void(^titleClick)(NSInteger index);
// baise的滑块
@property (nonatomic, strong) UIView *backgroundView;
// 辅助属性
@property (nonatomic, strong) UIButton *selectButton;

@end

@implementation WZBSegmentedControl

+ (instancetype)segmentWithFrame:(CGRect)frame titles:(NSArray *)titles titleClick:(void(^)(NSInteger index))titleClick {
    return [[self alloc] initWithFrame:frame titles:titles titleClick:titleClick];
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles titleClick:(void(^)(NSInteger index))titleClick {
    if (self = [super initWithFrame:frame]) {
        
        self.titles = titles;
        self.titleClick = titleClick;
        
        // 创建底部白色滑块
        [self setupBackgroundView];
        // 创建所有按钮
        [self setupAllButton];
        // 设置其他基本属性
        [self setupBase];
        // 先调一下这个方法，默认选择第一个按钮
        [self buttonClick:[self viewWithTag:WZBButtonTag]];
    }
    return self;
}

- (void)setupBackgroundView {
    UIView *backgroundView = [[UIView alloc] initWithFrame:(CGRect){0, 0, self.frame.size.width / self.titles.count, self.frame.size.height}];
    [self addSubview:backgroundView];
    backgroundView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = backgroundView;
}

- (void)setupAllButton {
    NSInteger count = self.titles.count;
    for (NSInteger i = 0; i < count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        CGFloat x = i * self.frame.size.width / count;
        CGFloat y = 0;
        CGFloat w = self.frame.size.width / count;
        CGFloat h = self.frame.size.height;
        button.frame = CGRectMake(x, y, w, h);
        [button setTitle:self.titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        button.backgroundColor = [UIColor clearColor];
        button.tag = WZBButtonTag + i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setAdjustsImageWhenHighlighted:NO];
    }
}

- (void)setupBase {
    ViewBorderRadius(self, self.frame.size.height / 2, 1, [UIColor whiteColor]);
    ViewBorderRadius(self.backgroundView, self.frame.size.height / 2, 0, [UIColor whiteColor]);
}

- (void)buttonClick:(UIButton *)button {
    [self setContentOffset:(CGPoint){(button.tag - WZBButtonTag) * (self.frame.size.width) / self.titles.count, 0}];
    [self.selectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.selectButton = button;
    if (self.titleClick) {
        self.titleClick(button.tag - WZBButtonTag);
    }
}

- (void)setContentOffset:(CGPoint)contentOffset {
    CGRect frame = self.backgroundView.frame;
    frame.origin.x = contentOffset.x;
    self.backgroundView.frame = frame;
    
    // 找出要操作的两个button设置颜色（目前先这样写，后续改进）
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)v;
            CGFloat overLapWidth = CGRectIntersection(button.frame, self.backgroundView.frame).size.width;
            NSInteger gb = 255 - overLapWidth * (255 / (self.frame.size.width / self.titles.count));
            [button setTitleColor:WZBColor(255, gb, gb) forState:UIControlStateNormal];
        }
    }
}

@end
