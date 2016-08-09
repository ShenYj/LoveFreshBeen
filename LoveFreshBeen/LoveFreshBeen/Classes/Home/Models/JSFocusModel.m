//
//  JSFocusModel.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSFocusModel.h"

@implementation JSFocusModel


- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)focusWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        
        self.iD = key;
    }else{
    
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
