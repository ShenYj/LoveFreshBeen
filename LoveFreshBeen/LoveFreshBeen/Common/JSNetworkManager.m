//
//  JSNetworkManager.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSNetworkManager.h"


static JSNetworkManager *_instanceType = nil;

@implementation JSNetworkManager

+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instanceType = [[JSNetworkManager alloc] init];
        _instanceType.responseSerializer.acceptableContentTypes = [_instanceType.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        _instanceType.requestSerializer = [AFJSONRequestSerializer serializer];
        
    });
    return _instanceType;
}

// 请求数据公共方法
- (void)requestMethod:(RequestMethod)method withParameters:(id)parameters withUrlStrng:(NSString *)urlString withSuccess:(void(^)(id response))success withFailure:(void(^)(NSError *error))failure{
    
    if (method == GET) {
        
        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failure(error);
        }];
        
    }else{
        
        [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failure(error);
        }];
    }
    
}

- (void)requestHomePageDataWithParameters:(NSDictionary *)para withfinishedBlock:(void(^)(id res, NSError *error))finishedBlock{
    
    NSString *url = @"http://iosapi.itcast.cn/loveBeen/focus.json.php";
    
    [self requestMethod:POST withParameters:para withUrlStrng:url withSuccess:^(id response) {
        
        finishedBlock(response,nil);
        
    } withFailure:^(NSError *error) {
        
        finishedBlock(nil,error);
    }];
}

@end
