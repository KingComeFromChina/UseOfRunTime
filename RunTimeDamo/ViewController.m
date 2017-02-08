//
//  ViewController.m
//  RunTimeDamo
//
//  Created by 王垒 on 2017/2/7.
//  Copyright © 2017年 王垒. All rights reserved.
//

#import "ViewController.h"
#import "WangLei.h"
#import "UIImage+image.h"
#import "Person.h"
#import "NSObject+objc.h"
/*
 *
 *   1.使用运行时，需导入<objc/message.h>
 *   2.Build Setting -> 搜索msg -> 设置属性为No
 *
 */
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 消息机制
    // [self sendMessage];
    
    // 交换方法
    // [self exchangeMethod];
    
    // 动态添加方法
    // [self addMethod];
    
    // 分类添加属性
    [self addProperty];
}

- (void)addProperty{

    NSObject *objc = [[NSObject alloc]init];
    objc.name = @"小明";
    NSLog(@"%@",objc.name);
}

- (void)addMethod{

    Person *person = [[Person alloc]init];
   // [person performSelector:@selector(eat)];
   // [person performSelector:@selector(eat:)];
    [person performSelector:@selector(eat:) withObject:@"aaaa"];
}

- (void)exchangeMethod{

    UIImage *image = [UIImage imageNamed:@"123"];
    
    [UIImage imageNamed:@"123"];
    
    //每次使用都需要导入头文件，就算弄个pch文件也不太靠谱，看来需要一种新的方式
}

- (void)sendMessage{

    WangLei *wanglei = [[WangLei alloc]init];
    [wanglei makesiOSAPP];
    
    // OC:运行时机制，消息机制是运行时机制最重要的机制
    // 消息机制：任何方法的调用，本质都是发送消息
    
    // SEL:方法编号，根据方法编号就可以找到对应方法实现
    [wanglei performSelector:@selector(makesiOSAPP)];
    
    // 运行时，发送消息，谁做事情就调谁
    // Xcode5之后，苹果公司开始不建议使用底层方法，可以使用运行时
    
    // 举个例子，让wanglei发送消息
    
    objc_msgSend(wanglei, @selector(makesiOSAPP));
    objc_msgSend(wanglei, @selector(makes:),100);
    
    // 类名调用类方法，本质类名转换成类对象
    [WangLei makesiOSAPP];
    
    // 获取类对象
    Class WangLeiClass = [WangLei class];
    
    [WangLeiClass performSelector:@selector(makesiOSAPP)];
    
    // 运行时
    objc_msgSend(WangLeiClass, @selector(makesiOSAPP));

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
