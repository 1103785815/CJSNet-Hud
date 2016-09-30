//
//  CommonMacro.h
//  
//
//  Created by CM on 16/8/9.
//  Copyright © 2016年 CM. All rights reserved.
//

// 通用宏
#ifndef CommonMacro_h
#define CommonMacro_h



#define kDefaults                            [NSUserDefaults standardUserDefaults]

//尺寸
#define kScreenRect                          [[UIScreen mainScreen] bounds]
#define kScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight                        [[UIScreen mainScreen] bounds].size.height


//判断屏幕是否大于3.5英寸
#define kGreater_Than_480_Height             ScreenHeight > 480

//判断屏幕是否大于4.7英寸
#define kGreater_Than_667_Height             ScreenHeight > 677

//判断屏幕是否大于3.5英寸 大于则返回a
#define kGreater_Than_480H(a, b)             ScreenHeight > 480 ? a : b

//ViewFrame
#define kViewWidth(v)                        v.frame.size.width
#define kViewHeight(v)                       v.frame.size.height
#define kViewX(v)                            v.frame.origin.x
#define kViewY(v)                            v.frame.origin.y
#define kSelfViewHeight                      self.view.bounds.size.height
#define kRectMaxX(f)                         CGRectGetMaxX(f)
#define kRectMaxY(f)                         CGRectGetMaxY(f)
#define kRectMinX(f)                         CGRectGetMinX(f)
#define kRectMinY(f)                         CGRectGetMinY(f)


#endif /* CommonMacro_h */
