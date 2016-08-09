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

@interface JSHeaderView ()

// 轮播CollectionView
@property (nonatomic,strong) JSLoopView *collectionView;
// 底部的菜单区
@property (nonatomic,strong) JSMenumView *bottomMenumView;

@end

@implementation JSHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self prepareHeaderView];
    }
    return self;
}


// 设置视图
- (void)prepareHeaderView{
    
    [self addSubview:self.collectionView];
    [self addSubview:self.bottomMenumView];
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.mas_equalTo(self);
//        make.height.mas_equalTo(300);
//    }];
    
//    [self.bottomMenumView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.collectionView.mas_bottom);
//        make.left.bottom.right.mas_equalTo(self);
//    }];
    [self.bottomMenumView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.collectionView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self);
    }];
}


#pragma mark -- 懒加载

- (JSLoopView *)collectionView{
    
    if (_collectionView == nil) {
        _collectionView = [[JSLoopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 250)];
    }
    return _collectionView;
}

- (UIView *)bottomMenumView{
    
    if (_bottomMenumView == nil) {
        _bottomMenumView = [[JSMenumView alloc] init];
    }
    return _bottomMenumView;
}

@end
