//
//  NetWorkingHelper.h
//  zhiDanOA
//
//  Created by CM on 16/3/25.
//  Copyright © 2016年 CM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UploadParam.h"

//@class UploadParam;

/**
 *  网络请求类型
 */
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /**
     *  get请求
     */
    HttpRequestTypeGet = 0,
    /**
     *  post请求
     */
    HttpRequestTypePost
};
@interface NetWorkingHelper : NSObject

/**
 *  拼接参数
 *
 *  @param String 地址
 *  @return 请求的URL
 */
+ (NSString *)makeURLString:(NSString *)String;

/**
 *  发送get请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
              hudMessage:(NSString *)message
                  onView:(UIView *)view
                 success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
               hudMessage:(NSString *)message
                   onView:(UIView *)view
                  success:(void (^)(id))success
                  failure:(void (^)(NSError *))failure;


/**
 *  上传图片
 *
 *  @param URLString   上传图片的网址字符串
 *  @param parameters  上传图片的参数
 *  @param uploadParam 上传图片的信息
 *  @param success     上传成功的回调
 *  @param failure     上传失败的回调
 */
+ (void)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                uploadParam:(UploadParam *)uploadParam
                 hudMessage:(NSString *)message
                     onView:(UIView *)view
                    success:(void (^)())success
                    failure:(void (^)(NSError *))failure;

@end
