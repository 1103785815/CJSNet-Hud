//
//  CommonMacro.h
//  ZhiBuLuoShopOC
//
//  Created by CM on 16/8/9.
//  Copyright © 2016年 CM. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h



#define Defaults                            [NSUserDefaults standardUserDefaults]

//尺寸
#define ScreenRect                          [[UIScreen mainScreen] bounds]
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height


//判断屏幕是否大于3.5英寸
#define Greater_Than_480_Height             ScreenHeight > 480

//判断屏幕是否大于4.7英寸
#define Greater_Than_667_Height             ScreenHeight > 677

//判断屏幕是否大于3.5英寸 大于则返回a
#define Greater_Than_480H(a, b)             ScreenHeight > 480 ? a : b

//ViewFrame
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewHeight                      self.view.bounds.size.height
#define RectMaxX(f)                         CGRectGetMaxX(f)
#define RectMaxY(f)                         CGRectGetMaxY(f)
#define RectMinX(f)                         CGRectGetMinX(f)
#define RectMinY(f)                         CGRectGetMinY(f)


#endif /* CommonMacro_h */
