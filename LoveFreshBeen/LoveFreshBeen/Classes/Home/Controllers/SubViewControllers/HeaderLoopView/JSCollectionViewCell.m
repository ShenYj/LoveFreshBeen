//
//  JSCollectionViewCell.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSCollectionViewCell.h"

@implementation JSCollectionViewCell{
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
        
    }
    return self;
}

- (void)setImageUrlString:(NSString *)imageUrlString{
    
    _imageUrlString = imageUrlString;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString]];
}

@end
