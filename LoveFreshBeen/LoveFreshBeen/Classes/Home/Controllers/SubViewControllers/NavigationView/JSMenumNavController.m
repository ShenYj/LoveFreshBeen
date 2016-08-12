//
//  JSMenumNavController.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/10.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMenumNavController.h"


@implementation JSMenumNavController{
    
    JSIconsModel *_iconsModel;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController withJSIconsModel:(JSIconsModel *)model{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        
        // 成员变量赋值
        _iconsModel = model;
        [self setupUI];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

#pragma mark -- 设置UI
- (void)setupUI{
    
    
}


@end
