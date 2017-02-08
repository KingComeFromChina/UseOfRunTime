//
//  UIViewController+WLController.m
//  RunTimeDamo
//
//  Created by 王垒 on 2017/2/7.
//  Copyright © 2017年 王垒. All rights reserved.
//

#import "UIViewController+WLController.h"
#import <objc/message.h>

@implementation UIViewController (WLController)

+ (void)load{

    // 交换wl_viewDidAppear和系统的viewDidAppear的实现
    NSLog(@"交换wl_viewDidAppear和系统的viewDidAppear的实现");
    Method viewDidAppear = class_getInstanceMethod(self, @selector(viewDidAppear:));
    
    // wl_viewDidAppear
    Method wl_viewDidAppear = class_getInstanceMethod(self, @selector(wl_viewDidAppear:));
    
    // 交换实现方法
    method_exchangeImplementations(viewDidAppear, wl_viewDidAppear);
    
}

- (void)wl_viewDidAppear:(BOOL)animated{

    [self wl_viewDidAppear:YES];
    NSLog(@"走了自己定义的viewDidAppear方法");
}

@end
