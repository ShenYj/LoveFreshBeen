//
//  JSLoopView.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSHomeDataModel.h"


@interface JSLoopView : UICollectionView

@property (nonatomic,strong) JSHomeDataModel *data;

- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data;

@end