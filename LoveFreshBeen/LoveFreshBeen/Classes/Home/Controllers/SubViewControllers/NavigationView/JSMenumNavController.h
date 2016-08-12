//
//  JSMenumNavController.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/10.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSIconsModel.h"


@interface JSMenumNavController : UINavigationController


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController withJSIconsModel:(JSIconsModel *)model;

@end
