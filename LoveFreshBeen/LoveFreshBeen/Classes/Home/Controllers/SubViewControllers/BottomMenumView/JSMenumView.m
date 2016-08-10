//
//  JSMenumView.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMenumView.h"
#import "JSCustomFrameButton.h"

static NSInteger const menumButtonCounts = 4;

@implementation JSMenumView

- (instancetype)initWithFrame:(CGRect)frame withData:(JSHomeDataModel *)data{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self prepraView];
        
    }
    return self;
}

// 设置视图
- (void)prepraView{
    
    for (int i = 0; i < menumButtonCounts; i ++) {
        
        UIButton *button = [[JSCustomFrameButton alloc] init];
        [self addSubview: button];
        
        [button setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
        [button setTitle:@"测试" forState:UIControlStateNormal];
        
        [button setBackgroundColor:[UIColor js_randomColor]];
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat buttonWidth = SCREEN_WIDTH / menumButtonCounts;
    NSInteger index = 0;
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UIButton")]) {
            
            CGRect frame = view.frame;
            frame.origin.x = index * buttonWidth;
            frame.size.width = buttonWidth;
            view.frame = frame;
            
            index ++;
            
        }
    }
}
@end
