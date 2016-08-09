//
//  JSLoopView.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSLoopView.h"

@implementation JSLoopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    if (self) {
        self.backgroundColor = [UIColor js_randomColor];
    }
    return self;
}



@end
