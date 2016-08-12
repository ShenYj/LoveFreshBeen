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
    NSArray *_focusArr;

    // 定时器
    NSTimer *_timer;
}


- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data{
    self = [super initWithFrame:frame collectionViewLayout:[[JSFlowLayout alloc]init]];
    if (self) {
        
        // 成员变量赋值
        _data = data;
        // 设置图片资源数据
        _focusArr = _data.focus;
        
        // 设置随机背景色
        self.backgroundColor = [UIColor js_randomColor];

        self.dataSource = self;
        self.delegate = self;
        
        // 注册Cell
        [self registerClass:[JSCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_focusArr.count inSection:0];
            [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        });
        
        // 开启定时器
        [self startTimer];
        
    }
    return self;
}

// 开启定时器
- (void)startTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

// 停止定时器
- (void)stopTimer{
    
    [_timer invalidate];
    _timer = nil;
}

// 定时器自动翻页方法
- (void)nextPage{
    
    NSIndexPath *currentIndexPath = [self indexPathsForVisibleItems].lastObject;
    
    NSInteger nextItem = currentIndexPath.item + 1;
    
    if (nextItem == _focusArr.count * 100) {
        
        nextItem = _focusArr.count;
    }
    
    [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextItem inSection:currentIndexPath.section] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}

#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _focusArr.count * 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    JSActivitiesModel *activitiesModel = _focusArr[indexPath.item % _focusArr.count];
    
    cell.imageUrlString = activitiesModel.img;
    
    return cell;
}

#pragma mark -- UICollectionViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSInteger currentPageIndex = (NSInteger)( (offsetX+self.bounds.size.width*0.5) / self.bounds.size.width ) % _focusArr.count;
    
    if (self.currentIndexHandler) {
        
        self.currentIndexHandler(currentPageIndex);
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    CGFloat contentOffSetX = scrollView.contentOffset.x;
    NSInteger currentIndex = contentOffSetX / scrollView.bounds.size.width;
    
    
    if (currentIndex == 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_focusArr.count inSection:0];
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        return;
    }
    
    if (currentIndex == [self numberOfItemsInSection:0] - 1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_focusArr.count - 1 inSection:0];
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        return;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JSFocusModel *model = _focusArr[indexPath.item % _focusArr.count];
    
    NSURL *customURL = [NSURL URLWithString:model.toURL];
    //    [[UIApplication sharedApplication] openURL:customURL];
    NSLog(@"%@",customURL);
    
    SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:customURL];
    
    // 执行回调
    if (self.presentSafariHandler) {
        
        self.presentSafariHandler(safariViewController);
    }
    
}
// 当开始拖拽时,停止停止器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self stopTimer];
}

// 停止拖拽时,开启定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self startTimer];
}

- (void)dealloc{
    
    [_timer invalidate];
    _timer = nil;
}

@end
