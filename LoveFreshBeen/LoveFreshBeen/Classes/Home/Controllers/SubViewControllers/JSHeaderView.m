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
    
    [self.bottomMenumView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.collectionView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self);
    }];
}


#pragma mark -- 懒加载

- (JSLoopView *)collectionView{
    
    if (_collectionView == nil) {
        
        _collectionView = [[JSLoopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) withData:_data];
        
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
