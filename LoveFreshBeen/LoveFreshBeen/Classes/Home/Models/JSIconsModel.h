//
//  JSIconsModel.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSIconsModel : NSObject

// 跳转URL
@property (nonatomic,copy) NSString *customURL;
// id
@property (nonatomic,copy) NSString *iD;
// 图标
@property (nonatomic,copy) NSString *img;
// 名称
@property (nonatomic,copy) NSString *name;

// 字典转模型对象方法和类方法
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)IconsWithDict:(NSDictionary *)dict;

@end
