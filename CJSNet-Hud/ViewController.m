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
}
- (void)viewDidAppear:(BOOL)animated{
    
    NSDictionary *params = @{@"userName":@"xiaoMing",
                             @"userPassword":@"123456"
                             };
    [NetWorkingHelper postWithURLString:[NetWorkingHelper makeURLString:NetLogin] parameters:params showHudBlock:^{
        [CJSHUDHelper showWaitHud:@"转圈圈.."];
    } warningHudBlock:^(NSString * warning){
        [CJSHUDHelper showWaringHud:warning];
    } hidenHudBlock:^{
        [CJSHUDHelper hidenHud];
    } success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

@end
