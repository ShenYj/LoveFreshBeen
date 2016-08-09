//
//  JSNetworkManager.h
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum : NSUInteger {
    GET,
    POST,
} RequestMethod;

@interface JSNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

// 获取首页数据
- (void)requestHomePageDataWithParameters:(NSDictionary *)para withfinishedBlock:(void(^)(id res, NSError *error))finishedBlock;


@end
