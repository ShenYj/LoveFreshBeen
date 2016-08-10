//
//  JSLoopView.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSLoopView.h"
#import "JSFlowLayout.h"
#import "JSCollectionViewCell.h"

static NSString *reuseIdentifier = @"ReuseIdentifier";

@interface JSLoopView () <UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation JSLoopView{
    
    // 全部数据
    JSHomeDataModel *_data;

    // 轮播器图片资源
    NSArray *_images;
    
}



- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data{
    self = [super initWithFrame:frame collectionViewLayout:[[JSFlowLayout alloc]init]];
    if (self) {
        
        // 成员变量赋值
        _data = data;
        // 设置图片资源数据
        _images = _data.activities;
        // 设置随机背景色
        self.backgroundColor = [UIColor js_randomColor];

        self.dataSource = self;
        self.delegate = self;
        
        // 注册Cell
        [self registerClass:[JSCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_images.count inSection:0];
            [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        });
        
        
    }
    return self;
}


#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _images.count * 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    JSActivitiesModel *activitiesModel = _images[indexPath.item % _images.count];
    
    cell.imageUrlString = activitiesModel.img;
    
    return cell;
}

#pragma mark -- UICollectionViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat contentOffSetX = scrollView.contentOffset.x;
    NSInteger currentIndex = contentOffSetX / scrollView.bounds.size.width;
    
    if (currentIndex == 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_images.count inSection:0];
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        return;
    }
    
    if (currentIndex == [self numberOfItemsInSection:0] - 1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_images.count - 1 inSection:0];
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        return;
    }
    
}

@end
