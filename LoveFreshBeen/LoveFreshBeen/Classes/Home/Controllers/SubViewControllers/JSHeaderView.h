//
//  JSHeaderView.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSHomeDataModel.h"
#import <SafariServices/SafariServices.h>
#import "JSMenumNavController.h"

@interface JSHeaderView : UIView


// modal展示控制器  -->  loopView
@property (nonatomic,copy) void(^presentSafariHandler)(SFSafariViewController *safariVC);
// 点击菜单区按钮回调 --> MenumView
@property (nonatomic,copy) void(^menumButtonHandler)(JSMenumNavController *navController);

- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data;


@end
