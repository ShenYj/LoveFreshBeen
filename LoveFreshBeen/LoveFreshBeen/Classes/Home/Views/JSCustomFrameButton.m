//
//  JSNavigationButton.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSCustomFrameButton.h"
#import "UIView+JSFrame.h"

@implementation JSCustomFrameButton

- (instancetype)init{
    
    self = [super init];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    [self.imageView sizeToFit];
    self.imageView.y = 0;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 6, 10, 0);
    
    self.titleLabel.y = self.imageView.h + 5;
    self.titleLabel.x = 0;
    self.titleLabel.w = frame.size.width;
    
    self.contentEdgeInsets = UIEdgeInsetsMake(15, 0, 0, 0);
    self.titleLabel.textColor = [UIColor blackColor];
    
}

@end
