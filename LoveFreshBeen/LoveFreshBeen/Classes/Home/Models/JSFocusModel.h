//
//  JSFocusModel.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSFocusModel : NSObject

// id
@property (nonatomic,copy) NSString *iD;
// 图片链接
@property (nonatomic,copy) NSString *img;
// 名称
@property (nonatomic,copy) NSString *name;

// 字典转模型对象和类方法
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)focusWithDict:(NSDictionary *)dict;

@end
