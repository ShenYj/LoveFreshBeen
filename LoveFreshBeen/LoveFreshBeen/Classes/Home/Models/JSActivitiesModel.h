//
//  JSActivitiesModel.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSActivitiesModel : NSObject
// 跳转url
@property (nonatomic,copy) NSString *customURL;
// id
@property (nonatomic,copy) NSString *iD;
// 图片URL
@property (nonatomic,copy) NSString *img;
// 名称
@property (nonatomic,copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)activitiesWithDict:(NSDictionary *)dict;


@end
