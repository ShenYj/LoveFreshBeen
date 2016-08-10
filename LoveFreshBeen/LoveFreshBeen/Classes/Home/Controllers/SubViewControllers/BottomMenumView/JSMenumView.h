//
//  JSMenumView.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSHomeDataModel.h"
#import "JSMenumButton.h"
#import "JSMenumNavController.h"

@class JSMenumView;

@protocol JSMenumViewDelegate <NSObject>

@optional
- (void)menumView:(JSMenumView *)menumView withButton:(JSMenumButton *)button;

@end

@interface JSMenumView : UIView

@property (nonatomic,weak) id <JSMenumViewDelegate> delegate;

// 点击菜单区按钮回调
@property (nonatomic,copy) void(^menumButtonHandler)(JSMenumNavController *navController);

- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data;

@end
