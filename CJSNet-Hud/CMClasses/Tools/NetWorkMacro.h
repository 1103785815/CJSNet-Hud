//
//  NetWorkMacro.h
//  ZhiBuLuoShopOC
//
//  Created by CM on 16/8/15.
//  Copyright © 2016年 CM. All rights reserved.
//

#ifndef NetWorkMacro_h
#define NetWorkMacro_h



#define TOKEN                                    @"554357b1085e8e00dc04639035bc9cf9"

#define NetWorkCode                              @"code"
#define NetWorkMessage                           @"message"
#define NetWorkData                              @"Data"

#define NetWorkSucceedCode                       @"200"
#define NetWorkFailureCode                       @"400"

#define NetWorkBaseUrl_test                      @"http://192.168.30.4:8080/zdclan/"

#define NetWorkBaseUrl_product                   @"http://139.196.110.242:8083/zdclan/"

#define NetWorkBaseUrl                           NetWorkBaseUrl_product

//获取验证码
#define NetGetVerificationCode                   @"my.action?method=sendsms"
//商户注册
#define NetAddSelleUser                          @"my.action?method=addSelleuser"
//登陆接口
#define NetLogin                                 @"my.action?method=login"
//修改头像
#define NetUpdatePhoto                           @"my.action?method=updatePhoto"
//获取店铺信息
#define NetGetStoreDetails                       @"shopapp.action?method=details"
//上传图片
#define NetUpLoadImage                           @"upload.action?method=uploadImage"
//修改店铺信息
#define NetEditShop                              @"shopapp.action?method=editShop"
//商品列表
#define NetGoodList                              @"goodsapp.action?method=goodsList"
//商品管理
#define NetUpdateGoodsStatus                     @"goodsapp.action?method=updatesStatus"
//删除商品
#define NetDeleteGoods                           @"goodsapp.action?method=delGoods"

#endif /* NetWorkMacro_h */
