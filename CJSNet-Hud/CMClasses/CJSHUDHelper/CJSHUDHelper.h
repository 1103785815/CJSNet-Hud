//
//  CJSHUDHelper.h
//  
//
//  Created by CM on 16/3/30.
//  Copyright © 2016年 CM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface CJSHUDHelper : NSObject
// 弹出 菊花 HUD
+ (void)showWaitHud:(NSString *)message onView:(UIView *)view;
+ (void)showWaitHud:(NSString *)message;
// 弹出 提示信息 HUD
+ (void)showSucceedHud:(NSString *)message;
+ (void)showErrorHud:(NSString *)message;
+ (void)showWaringHud:(NSString *)message;
// 弹出 Toast HUD
+ (void)showMessageHud:(NSString *)message onView:(UIView *)view;
+ (void)showMessageHud:(NSString *)message;
// 移除 HUD
+ (void)hidenHudFromView:(UIView *)view;
+ (void)hidenHud;
@end
