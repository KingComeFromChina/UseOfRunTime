//
//  WangLei.m
//  RunTimeDamo
//
//  Created by 王垒 on 2017/2/7.
//  Copyright © 2017年 王垒. All rights reserved.
//

#import "WangLei.h"

@implementation WangLei

+ (void)makesiOSAPP{

    NSLog(@"类方法-开发iOSAPP");
}

- (void)makesiOSAPP{

    NSLog(@"对象方法-开发iOSAPP");
}

- (void)makes:(NSInteger)year{

    NSLog(@"从事工作%ld年了",(long)year);
}

@end
