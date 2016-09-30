//
//  CJSTool.h
//  
//
//  Created by CM on 15/12/18.
//  Copyright © 2015年 CM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CJSTool : NSObject

/**
 *  判断label高度
 *
 *  @param str       label文字的内容
 *  @param strSize   label上字体的大小
 *  @param labelWith label的宽度
 *
 *  @return label的高度
 */
+ (CGFloat)getLabelHeightWith:(NSString *)str AndStrSize:(int)strSize AndLabelWith:(CGFloat)labelWith;

/**
 *  延迟
 */
+ (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
/**
 *  获取设备ID
 */
+ (NSString *)deviceID;
/**
 *  判断相机是否可用
 */
+ (BOOL)boolForWethearCameraAuth;
/**
 *  NSDate转时间戳
 */
+ (NSString *)transFrmeDate:(NSDate *)date;
/**
 *  时间戳转时间字符串
 */
+ (NSString *)timeStringFromTimestamp:(NSString *)timestamp withMode:(NSString *)mode;
/**
 *  navigationBar 返回按钮
 */
+ (UIBarButtonItem *)getBarButtonItemWithString:(NSString *)string;
/**
 *  颜色转图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+ (UIImage *)imageFromColor:(UIColor *)color;
/**
 *  十六进制的颜色转换为UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
/**
 *  获取当前时间
 */
+ (NSDateComponents *)currentDateComp;
/**
 *  获取当前星期几
 */
+ (NSString *)currentWeeKDay;
/**
 *  获取当前日期
 */
+ (NSString *)currentDate;
/**
 *  获取当前时间
 */
+ (NSString *)currentTime;

/**
 *  MD5加密
 */
+ (NSString *)md5HexDigest:(NSString*)input;
/**
 *  压缩图片
 */
+ (UIImage*)imageWithImage:(UIImage*)image scale:(CGFloat) scale;
/**
 *  图片添加文字
 */
+ (UIImage *)addText:(NSString *)text OnImg:(UIImage *)img;

/**
 *  单条刷新tableView
 */
+ (void)reloadRowsAtRow:(int)row Section:(int)section InTableView:(UITableView *)tableview;

/**
 *  判断系统版本
 */
+ (NSString *)getCurrentSystemVersion;

/**
 *  验证手机号正则表达式
 */
+ (BOOL)checkTel:(NSString *)str;

@end
