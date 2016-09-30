//
//  ViewController.m
//  CJSNet-Hud
//
//  Created by mtrcjs on 16/9/30.
//  Copyright © 2016年 CJS. All rights reserved.
//

#import "ViewController.h"
#import "CMClasses.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // 参数字典
    NSDictionary *params = @{};
    
    [NetWorkingHelper postWithURLString:[NetWorkingHelper makeURLString:NetLogin] parameters:params hudMessage:@"测试请求" onView:self.view success:^(id responseObject) {
        // 返回的数据字典
        NSDictionary *dict = responseObject;

    } failure:^(NSError *error) {
        
    }];
}

@end
