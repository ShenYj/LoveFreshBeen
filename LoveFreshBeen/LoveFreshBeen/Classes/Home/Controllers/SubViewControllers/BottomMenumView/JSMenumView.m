//
//  JSMenumView.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMenumView.h"
#import "JSMenumButtom.h"

static NSInteger const menumButtonCounts = 4;
static CGFloat const menumButtonWidthAndHeight = 50;

@implementation JSMenumView{
    
    // 全部数据
    JSHomeDataModel *_data;
    
    // 轮播器图片资源
    NSArray *_iconsArr;
}

- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 成员变量赋值
        _data = data;
        _iconsArr = _data.icons;
        
        [self prepraView];
        
    }
    return self;
}

// 设置视图
- (void)prepraView{
    
    for (int i = 0; i < menumButtonCounts; i ++) {
        
        JSFocusModel *model = _iconsArr[i];
        JSMenumButtom *button = [[JSMenumButtom alloc] init];
        [self addSubview: button];
        
        
        [button sd_setImageWithURL:[NSURL URLWithString:model.img] forState:UIControlStateNormal];
        [button setTitle:model.name forState:UIControlStateNormal];

    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat marginHorizontal = ( SCREEN_WIDTH - menumButtonCounts * menumButtonWidthAndHeight ) / ( menumButtonCounts + 1);
    CGFloat marginVertical = ( self.bounds.size.height - menumButtonWidthAndHeight) * 0.5;
    
    NSInteger index = 0;
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"JSMenumButtom")]) {
            
            CGFloat x = marginHorizontal + ( marginHorizontal + menumButtonWidthAndHeight) * index;
            
            view.frame = CGRectMake(x, marginVertical, menumButtonWidthAndHeight, menumButtonWidthAndHeight);
            
            index ++;
            
        }
    }
}
@end
