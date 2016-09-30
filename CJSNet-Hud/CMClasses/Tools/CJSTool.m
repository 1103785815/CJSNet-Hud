//
//  CJSTool.m
//  songJuLang
//
//  Created by CM on 15/12/18.
//  Copyright © 2015年 CM. All rights reserved.
//

#import "CJSTool.h"
#import <AVFoundation/AVFoundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface CJSTool()<UIActionSheetDelegate>

@end

@implementation CJSTool

/**
 *  判断label高度
 *
 *  @param str       label文字的内容
 *  @param strSize   label上字体的大小
 *  @param labelWith label的宽度
 *
 *  @return label的高度
 */

+ (CGFloat)getLabelHeightWith:(NSString *)str AndStrSize:(int)strSize AndLabelWith:(CGFloat)labelWith{

    UIFont *font = [UIFont fontWithName:@"Arial" size:strSize];
    CGSize size = CGSizeMake(labelWith,CGFLOAT_MAX);
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize realSize = [str boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return realSize.height;
}


+ (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay{
    block = [block copy];
    [self performSelector:@selector(fireBlockAfterDelay:) withObject:block afterDelay:delay];
}
+ (void)fireBlockAfterDelay:(void (^)(void))block{
    block();
}


+ (NSString *)deviceID{

    NSLog(@"%@",[[[UIDevice currentDevice] identifierForVendor] UUIDString]);
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (BOOL)boolForWethearCameraAuth
{
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        NSString *mediaType = AVMediaTypeVideo;
        
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
        
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
            
            return  NO;
            
        }
        return YES;
    }
    return YES;
}

+ (NSString *)transFrmeDate:(NSDate *)date{
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];  
    return timeSp;
}
+ (NSString *)timeStringFromTimestamp:(NSString *)timestamp withMode:(NSString *)mode{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:mode];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timestamp intValue]];
    NSString *addTime = [dateFormatter stringFromDate:confromTimesp];
    return addTime;
}

+ (UIBarButtonItem *)getBarButtonItemWithString:(NSString *)string{

     return [[UIBarButtonItem alloc] initWithTitle:string style:UIBarButtonItemStylePlain target:nil action:nil];
}
+ (UIImage *)imageFromColor:(UIColor *)color{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    CGRect rect = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
//十六进制的颜色转换为UIColor
+ (UIColor *) colorWithHexString: (NSString *)color{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (NSDateComponents *)currentDateComp{
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitWeekday |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:date];
    return comps;
}

+ (NSString *)currentWeeKDay{

    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitWeekday |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:date];
    return arrWeek[[comps weekday]];
}
+ (NSString *)currentDate {
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY.MM.dd"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
    
}
+ (NSString *)currentTime {

    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
    
}

+ (NSString *)md5HexDigest:(NSString*)input{
    
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

/**
 *  压缩图片
 *
 *  @param image   要压缩的图片
 *  @param newSize 新大小
 *
 *  @return 压缩后的图片
 */
+ (UIImage*)imageWithImage:(UIImage*)image scale:(CGFloat) scale{
    
    
    CGSize imageSize = image.size;
    CGFloat imgScale = imageSize.width/imageSize.height;
    
    imageSize.height = imageSize.height * scale;
    imageSize.width = imageSize.height * imgScale ;
    // Create a graphics image context
    UIGraphicsBeginImageContext(imageSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,imageSize.width,imageSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}

+ (UIImage *)addText:(NSString *)text OnImg:(UIImage *)img{
    
    UIFont *font = [UIFont systemFontOfSize:20];
    CGSize size = CGSizeMake(img.size.width/2,img.size.height/2);
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize realSize = [text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    //1.获取上下文
    UIGraphicsBeginImageContext(img.size);
    //2.绘制图片
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    //3.绘制水印文字
    CGRect rect = CGRectMake((img.size.width - realSize.width)/2, (img.size.height - realSize.height)/2, realSize.width, realSize.height);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    //文字的属性
    NSDictionary *dic = @{
                          NSFontAttributeName:[UIFont systemFontOfSize:20],
                          NSParagraphStyleAttributeName:style,
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    //将文字绘制上去
    [text drawInRect:rect withAttributes:dic];
    //4.获取绘制到得图片
    UIImage *watermarkImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.结束图片的绘制
    UIGraphicsEndImageContext();
    return watermarkImage;
}

+ (void)reloadRowsAtRow:(int)row Section:(int)section InTableView:(UITableView *)tableview{

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [tableview reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}

/**
 *  获取当前系统版本
 *  如果直接调用读取系统的方法， 可能出现一些问题
 *
 */
+ (NSString *)getCurrentSystemVersion {
    
    //静态全局变量  用来存系统版本，以便反复读取
    static NSString *currentVersion = nil;
    
    if (!currentVersion) {
        currentVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentSystemVersion"];
    }
    
    //当NSUserDefaults中没有值时，获取系统的版本并存进去
    if (!currentVersion) {
        currentVersion = [[UIDevice currentDevice] systemVersion];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"currentSystemVersion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return currentVersion;
}

+ (BOOL)checkTel:(NSString *)str{
    
    //1[0-9]{10}
    
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    
    //    NSString *regex = @"[0-9]{11}";
    
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch) {
        return NO;
    }
    return YES;
}
@end
