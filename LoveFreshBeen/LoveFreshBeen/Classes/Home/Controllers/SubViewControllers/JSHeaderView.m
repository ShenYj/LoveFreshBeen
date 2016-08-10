//
//  JSHeaderView.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSHeaderView.h"
#import "JSLoopView.h"
#import "JSMenumView.h"

extern CGFloat headerViewHeight;
static CGFloat loopViewHeight = 200;
static CGFloat pageControlHeight = 20;
static CGFloat pageControlWidth = 100;
static CGFloat pageControlMargin = 10;
@interface JSHeaderView ()

// 轮播CollectionView
@property (nonatomic,strong) JSLoopView *collectionView;
// 底部的菜单区
@property (nonatomic,strong) JSMenumView *bottomMenumView;
// PageControl
@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation JSHeaderView{
    // 首页数据
    JSHomeDataModel *_data;
}

- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data{
    
    self = [super initWithFrame:frame];
    if (self) {
        // 成员变量赋值
        _data = data;
        
        [self prepareHeaderView];
        
        [self setupUI];
        
    }
    return self;
}



// 设置视图
- (void)prepareHeaderView{
    
    [self addSubview:self.collectionView];
    [self addSubview:self.bottomMenumView];
    [self addSubview:self.pageControl];
    
    
}
- (void)setupUI{
    
    __weak typeof(self) weakSelf = self;
    
    // 点击轮播图片跳转
    [self.collectionView setPresentSafariHandler:^(SFSafariViewController *safari) {
        weakSelf.presentSafariHandler(safari);
    }];
    
    [self.collectionView setCurrentIndexHandler:^(NSInteger index) {
        weakSelf.pageControl.currentPage = index;
    }];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.bottomMenumView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.collectionView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self);
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.collectionView.mas_right).mas_offset(-pageControlMargin);
        make.bottom.mas_equalTo(self.collectionView).mas_offset(-pageControlMargin);
        make.width.mas_equalTo(pageControlWidth);
        make.height.mas_equalTo(pageControlHeight);
    }];
    
}


#pragma mark -- 懒加载

- (JSLoopView *)collectionView{
    
    if (_collectionView == nil) {
        
        _collectionView = [[JSLoopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, loopViewHeight) withData:_data];
        
    }
    return _collectionView;
}

- (UIView *)bottomMenumView{
    
    if (_bottomMenumView == nil) {
        _bottomMenumView = [[JSMenumView alloc] initWithFrame:CGRectMake(0, loopViewHeight, SCREEN_WIDTH, headerViewHeight - loopViewHeight) withData:_data];
    }
    return _bottomMenumView;
}

- (UIPageControl *)pageControl{
    
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = _data.activities.count;
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    }
    return _pageControl;
}

@end
