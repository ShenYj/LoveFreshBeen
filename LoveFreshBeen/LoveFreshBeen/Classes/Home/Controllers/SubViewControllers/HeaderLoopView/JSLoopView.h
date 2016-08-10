//
//  JSLoopView.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSHomeDataModel.h"
#import <SafariServices/SafariServices.h>

//@class JSLoopView;
//@protocol JSLoopViewDelegate <NSObject>
//
//@optional
//- (void)loopView:(JSLoopView *)loopView withCurrentIndex:(NSInteger)index;
//@end

@interface JSLoopView : UICollectionView

//@property (nonatomic,weak) id <JSLoopViewDelegate> loopViewDelegate;

// 数据容器
@property (nonatomic,strong) JSHomeDataModel *data;

// modal展示控制器
@property (nonatomic,copy) void(^presentSafariHandler)(SFSafariViewController *safariVC);

// 回传pageControl索引
@property (nonatomic,copy) void(^currentIndexHandler)(NSInteger index);

// 对象方法
- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data;

@end
