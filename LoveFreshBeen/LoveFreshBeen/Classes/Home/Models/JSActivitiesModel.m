//
//  JSActivitiesModel.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSActivitiesModel.h"

@implementation JSActivitiesModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)activitiesWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

- (void)setValue:(id)value forKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        // 手动字典转模型
        self.iD = key;
    }else{
        [super setValue:value forKey:key];
    }
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
