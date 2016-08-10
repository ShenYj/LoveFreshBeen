//
//  JSMenumButtom.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/10.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSMenumButton.h"
#import "UIView+JSFrame.h"

@implementation JSMenumButton

- (instancetype)init{
    
    self = [super init];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    self.imageView.y = 0;
    
    self.titleLabel.y = self.imageView.h + 5;
    self.titleLabel.x = 0;
    self.titleLabel.w = frame.size.width;
    self.titleLabel.h = frame.size.height - self.imageView.h - 5;
    
    self.contentEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
    self.titleLabel.textColor = [UIColor blackColor];
    
}


@end
