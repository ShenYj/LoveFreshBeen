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

@interface JSHeaderView : UIView

@property (nonatomic,copy) void(^presentSafariHandler)(SFSafariViewController *safariVC);

- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data;


@end
