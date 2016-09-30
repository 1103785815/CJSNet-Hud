//
//  CJSHUDHelper.m
//  zhiDanOA
//
//  Created by CM on 16/3/30.
//  Copyright © 2016年 CM. All rights reserved.
//

#import "CJSHUDHelper.h"
#import "MBProgressHUD.h"

@implementation CJSHUDHelper

+ (void)showWaitHud:(NSString *)message onView:(UIView *)view{
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.bezelView.color = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    
    hud.label.text = message;
}
+ (void)showWaitHud:(NSString *)message{

    [self showWaitHud:message onView:nil];
}

+ (void)showResultHud:(NSString *)message icon:(NSString *)icon onView:(UIView *)view{
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    UIImage *image = [[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    hud.customView = imageView;
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = message;
    
    hud.bezelView.color = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    
    [hud hideAnimated:YES afterDelay:2.f];
    
}
+ (void)showSucceedHud:(NSString *)message{
    
    [self showResultHud:message icon:@"Checkmark" onView:nil];
    
}
+ (void)showErrorHud:(NSString *)message{

    [self showResultHud:message icon:@"Error" onView:nil];
}
+ (void)showWaringHud:(NSString *)message{
    
    [self showResultHud:message icon:@"Warning" onView:nil];
}

+ (void)showMessageHud:(NSString *)message onView:(UIView *)view{

    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.bezelView.color = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.offset = CGPointMake(0.f, 0);
    [hud hideAnimated:YES afterDelay:2.f];
}

+ (void)showMessageHud:(NSString *)message{

    [self showMessageHud:message onView:nil];
}

+ (void)hidenHudFromView:(UIView *)view{
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (void)hidenHud{
    
    [self hidenHudFromView:nil];
}
@end
