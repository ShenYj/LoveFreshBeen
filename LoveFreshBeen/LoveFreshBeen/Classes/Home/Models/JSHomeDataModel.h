//
//  JSHomeDataModel.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSActivitiesModel.h"
#import "JSFocusModel.h"
#import "JSIconsModel.h"


@interface JSHomeDataModel : NSObject

// 列表
@property (nonatomic,strong) NSArray *activities;//<JSActivitiesModel *>
// 焦点
@property (nonatomic,strong) NSArray *focus;    //<JSFocusModel *>
// 分类
@property (nonatomic,strong) NSArray *icons;    //<JSIconsModel *>

// 字典转模型对象方法
- (instancetype)initWithDict:(NSDictionary *)dict;
// 字典转模型类方法
+ (instancetype)DataWithDict:(NSDictionary *)dict;

@end
