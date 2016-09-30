//
//  CJSHUDHelper.h
//  zhiDanOA
//
//  Created by CM on 16/3/30.
//  Copyright © 2016年 CM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface CJSHUDHelper : NSObject

+ (void)showWaitHud:(NSString *)message onView:(UIView *)view;
+ (void)showWaitHud:(NSString *)message;

+ (void)showSucceedHud:(NSString *)message;
+ (void)showErrorHud:(NSString *)message;
+ (void)showWaringHud:(NSString *)message;

+ (void)showMessageHud:(NSString *)message onView:(UIView *)view;
+ (void)showMessageHud:(NSString *)message;

+ (void)hidenHudFromView:(UIView *)view;
+ (void)hidenHud;
@end
