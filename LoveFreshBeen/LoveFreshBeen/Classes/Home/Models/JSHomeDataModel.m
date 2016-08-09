//
//  JSHomeDataModel.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSHomeDataModel.h"

@implementation JSHomeDataModel


- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)DataWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

// 转模型
- (void)setActivities:(NSArray *)activities{
    
    NSMutableArray *mArr = [NSMutableArray array];
    
    for (NSDictionary *dic in activities) {
        
        JSActivitiesModel *model = [JSActivitiesModel activitiesWithDict:dic];
        [mArr addObject:model];
    }
    
    _activities = mArr.copy;
    
}

- (void)setFocus:(NSArray *)focus{
    
    NSMutableArray *marr = [NSMutableArray array];
    
    for (NSDictionary *dic in focus) {
        
        JSFocusModel *model = [JSFocusModel focusWithDict:dic];
        [marr addObject:model];
    }
    _focus = marr.copy;
}

- (void)setIcons:(NSArray *)icons{
    
    NSMutableArray *marr = [NSMutableArray array];
    
    for (NSDictionary *dic in icons) {
        
        JSIconsModel *model = [JSIconsModel IconsWithDict:dic];
        [marr addObject:model];
    }
    _icons = marr.copy;
}
@end
