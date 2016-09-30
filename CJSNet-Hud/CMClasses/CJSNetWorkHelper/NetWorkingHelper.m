//
//  NetWorkingHelper.m
//  
//
//  Created by CM on 16/3/25.
//  Copyright © 2016年 CM. All rights reserved.
//

#import "NetWorkingHelper.h"
#import "CJSHUDHelper.h"
#import "AFNetworking.h"

@implementation NetWorkingHelper

#pragma mark -- 拼接参数 --

+ (NSString *)makeURLString:(NSString *)String{
    
    return [NSString stringWithFormat:@"%@%@",NetWorkBaseUrl,String];
}

#pragma mark -- GET请求 --
+ (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
              hudMessage:(NSString *)message
                  onView:(UIView *)view
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure {
    // 如果message 不为空 添加HUD
    if (message) {
        [CJSHUDHelper showWaitHud:message onView:view];
    }
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /**
         *  AFNetworkReachabilityStatusUnknown          = -1,  // 未知
         *  AFNetworkReachabilityStatusNotReachable     =  0,  // 无连接
         *  AFNetworkReachabilityStatusReachableViaWWAN =  1,  // 3G
         *  AFNetworkReachabilityStatusReachableViaWiFi =  2,  // 局域网络Wifi
         */
        if (status == 1||status ==2) {
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            /**
             *  可以接受的类型
             */
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            /**
             *  请求队列的最大并发数
             */
            manager.operationQueue.maxConcurrentOperationCount = 5;
            /**
             *  请求超时的时间
             */
            manager.requestSerializer.timeoutInterval = 5;
            //  发起GET请求
            [manager GET:URLString parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (message) {
                    // 如果有message 则移除HUD
                    [CJSHUDHelper hidenHudFromView:view];
                }
                if (success) {
                    // 网络请求返回的字典
                    NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    // 请求结果状态码
                    NSString *code = [resultDict objectForKey:NetWorkCode];
                    if ([code isEqualToString:NetWorkSucceedCode]) {
                        /*
                         { code:200
                           message:"请求成功"
                           data:{ name:"小明"
                                  sex:"男"
                                  ....
                                 }
                         }
                         通常网络请求返回的数据的最外层字典只是用来判断请求是否成功的，并没有实质性的内容，所以我们在这里将最外层字典剥开，向内部回调真正的有用数据：
                         { name:"小明"
                           sex:"男"
                           ....
                         }
                         在这里解析外层字典，可以让每次网络请求时不必再写 解析外层字典的冗余代码
                         */
                        NSDictionary *dataDict = [resultDict objectForKey:NetWorkData];
                        success(dataDict);
                    }else{
                        /*
                         { code:400
                           message:"查无此人"
                           data:{ name:"小明"
                                  sex:"男"
                                  ....
                                 }
                         }
                         当请求失败时（服务器有正常的返回值），提示错误信息。
                         */
                        NSString *message = [NSString stringWithFormat:@"%@",[resultDict objectForKey:NetWorkMessage]];
                        [CJSHUDHelper showWaringHud:message];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    if (message) {
                        [CJSHUDHelper hidenHudFromView:view];
                    }
                    failure(error);
                    // 当请求失败时（服务器没有有正常的返回值），提示错误信息。
                    [CJSHUDHelper showWaringHud:[NSString stringWithFormat:@"Error:%@",error.userInfo[@"NSLocalizedDescription"]]];
                }
            }];
        }else{
            if (message) {
                [CJSHUDHelper hidenHudFromView:view];
            }
            [CJSHUDHelper showWaringHud:@"请检查网络连接"];
        }
    }];
}

#pragma mark -- POST请求 --
+ (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
               hudMessage:(NSString *)message
                   onView:(UIView *)view
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure {
    
    if (message) {
        [CJSHUDHelper showWaitHud:message onView:view];
    }
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == 1||status ==2) {
            
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.requestSerializer.timeoutInterval = 5;
            manager.operationQueue.maxConcurrentOperationCount = 5;
            [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (message) {
                    [CJSHUDHelper hidenHudFromView:view];
                }
                if (success) {
                    NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    NSString *code = [resultDict objectForKey:NetWorkCode];
                    
                    if ([code isEqualToString:NetWorkSucceedCode]) {
                        
                        NSDictionary *dataDict = [resultDict objectForKey:NetWorkData];
                        success(dataDict);
                    }else{
                        
                        NSString *message = [NSString stringWithFormat:@"%@",[resultDict objectForKey:NetWorkMessage]];
                        [CJSHUDHelper showWaringHud:message];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (message) {
                    [CJSHUDHelper hidenHudFromView:view];
                }
                if (failure) {
                    failure(error);
                    [CJSHUDHelper showWaringHud:[NSString stringWithFormat:@"Error:%@",error.userInfo[@"NSLocalizedDescription"]]];
                }
            }];
            
        }else{
            if (message) {
                [CJSHUDHelper hidenHudFromView:view];
            }
            [CJSHUDHelper showWaringHud:@"请检查网络连接"];
        }
    }];
}

#pragma mark -- 上传图片 --

+ (void)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                uploadParam:(UploadParam *)uploadParam
                 hudMessage:(NSString *)message
                     onView:(UIView *)view
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure {
    if (message) {
        [CJSHUDHelper showWaitHud:message onView:view];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:uploadParam.value name:uploadParam.key fileName:uploadParam.filename mimeType:uploadParam.mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (message) {
            [CJSHUDHelper hidenHudFromView:view];
        }
        if (success) {
            
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSString *code = [resultDict objectForKey:NetWorkCode];
            if ([code isEqualToString:NetWorkSucceedCode]) {
                NSDictionary *dataDict = [resultDict objectForKey:NetWorkData];
                success(dataDict);
            }else{
                NSString *message = [NSString stringWithFormat:@"%@",[resultDict objectForKey:NetWorkMessage]];
                [CJSHUDHelper showWaringHud:message];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            if (message) {
                [CJSHUDHelper hidenHudFromView:view];
            }
            failure(error);
            [CJSHUDHelper showWaringHud:[NSString stringWithFormat:@"Error:%@",error.userInfo[@"NSLocalizedDescription"]]];
        }
    }];
//    [manager setTaskDidSendBodyDataBlock:^(NSURLSession *session, NSURLSessionTask *task, int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
//        //nytesSent 本次上传了多少字节
//        //totalBytesSent 累计上传了多少字节
//        //totalBytesExpectedToSend 文件有多大，应该上传多少
//        NSLog(@"task %@ progree is %f",task,totalBytesSent*1.0/totalBytesExpectedToSend);
//    }];
}

@end
