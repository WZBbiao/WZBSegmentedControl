//
//  ViewController.m
//  WZBSegmentedControl
//
//  Created by normal on 2016/11/8.
//  Copyright © 2016年 WZB. All rights reserved.
//

#import "ViewController.h"
#import "WZBSegmentedControl.h"

#define WZBScreenW [UIScreen mainScreen].bounds.size.width
#define WZBScreenH [UIScreen mainScreen].bounds.size.height

#define WZBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface ViewController () <UIScrollViewDelegate, WZBSegmentedControlDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

- (NSArray *)titles;

@end

@implementation ViewController

- (NSArray *)titles {
    return @[@"热门", @"分类", @"订阅", @"其他"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    WZBSegmentedControl *segmentedControl = [WZBSegmentedControl segmentWithFrame:(CGRect){0, 0, 170, 25} titles:[self titles] tClick:^(NSInteger index) {
        NSLog(@"clickIndex : %zd", index);
        [self.scrollView setContentOffset:CGPointMake(index * WZBScreenW, 0)];
    }];
    segmentedControl.delegate = self;
    [segmentedControl setNormalColor:[UIColor whiteColor] selectColor:[UIColor redColor] edgingColor:[UIColor whiteColor]];
    // [segmentedControl setNormalColor:[UIColor whiteColor] selectColor:[UIColor blackColor] sliderColor:[UIColor clearColor] edgingColor:[UIColor clearColor] edgingWidth:0];
    
    self.navigationItem.titleView = segmentedControl;
    
    [self.navigationController.navigationBar setBarTintColor: WZBColor(224, 66, 44)];
    [self setupScrollView];
}

#pragma mark - <WZBSegmentedControlDelegate>
// segmented点击的时候调用，selectIndex：选中的index
- (void)segmentedValueDidChange:(WZBSegmentedControl *)segment selectIndex:(NSInteger)selectIndex {
//    NSLog(@"segmentedValueDidChange1---%zd", selectIndex);
}
// segmented点击的时候调用，selectIndex：选中的index，fromeIndex：从哪个index点过来的
- (void)segmentedValueDidChange:(WZBSegmentedControl *)segment selectIndex:(NSInteger)selectIndex fromeIndex:(NSInteger)fromeIndex {
//    NSLog(@"segmentedValueDidChange2---%zd, %zd", selectIndex, fromeIndex);
}
// segmented点击的时候调用，selectIndex：选中的index，fromeIndex：从哪个index点过来的,selectButton:选中的button
- (void)segmentedValueDidChange:(WZBSegmentedControl *)segment selectIndex:(NSInteger)selectIndex fromeIndex:(NSInteger)fromeIndex selectButton:(UIButton *)selectButton {
//    NSLog(@"segmentedValueDidChange3---%zd, %zd, %zd", selectIndex, fromeIndex, selectButton.tag);
}
// segmented点击的时候调用，selectIndex：选中的index，fromeIndex：从哪个index点过来的,selectButton:选中的button,allButtons:所有的button
- (void)segmentedValueDidChange:(WZBSegmentedControl *)segment selectIndex:(NSInteger)selectIndex fromeIndex:(NSInteger)fromeIndex selectButton:(UIButton *)selectButton allButtons:(NSArray *)allButtons {
//    NSLog(@"segmentedValueDidChange3---%zd, %zd, %zd, %zd", selectIndex, fromeIndex, selectButton.tag, allButtons.count);
}

- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    scrollView.contentSize = CGSizeMake([[self titles] count] * WZBScreenW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    // childViews
    NSArray *backgroundColors = @[[UIColor redColor], [UIColor blueColor]];
    for (NSInteger i = 0; i < [[self titles] count]; i++) {
        UIView *v1 = [[UIView alloc] initWithFrame:(CGRect){WZBScreenW * i, 0, WZBScreenW, WZBScreenH}];
        [scrollView addSubview:v1];
        v1.backgroundColor = backgroundColors[i % 2];
    }
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    WZBSegmentedControl *segmentedControl = (WZBSegmentedControl *)self.navigationItem.titleView;
    [segmentedControl setContentOffset:(CGPoint){scrollView.contentOffset.x / WZBScreenW * segmentedControl.frame.size.width / [self titles].count}];
}
@end
