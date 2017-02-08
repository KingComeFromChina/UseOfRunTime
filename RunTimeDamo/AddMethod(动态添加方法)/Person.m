//
//  Person.m
//  RunTimeDamo
//
//  Created by 王垒 on 2017/2/7.
//  Copyright © 2017年 王垒. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

/*
 *    定义函数
 *    没有返回值，参数(id,SEL)
 *    void(id,SEL)
 
 *    默认一个方法都有两个参数，self,_cmd,隐式参数
 *    self:方法调用者
 *    _cmd:调用方法的编号
 */

void iiiiiii(id self, SEL _cmd, id param1){

    NSLog(@"调用eat %@ %@ %@", self, NSStringFromSelector(_cmd),param1);
}

// 动态添加方法，首先实现这个resolveInstanceMethod
// resolveInstanceMethod调用:当调用了没有实现的方法没有实现就会调用resolveInstanceMethod
// resolveInstanceMethod作用:知道哪些方法没有实现，从而动态添加方法
// sel:没有实现方法

+ (BOOL)resolveInstanceMethod:(SEL)sel{

    NSLog(@"%@",NSStringFromSelector(sel));
    
    // 动态添加eat方法
    
    if (sel == @selector(eat:)) {
        /*
         * class_addMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>, <#IMP imp#>, <#const char *types#>)
         * cls:给哪个类添加方法
         * SEL:添加方法的方法编号是什么
         * IMP:方法实现，函数入口，函数名
         * types:方法类型
         */
        
        class_addMethod(self, sel, (IMP)iiiiiii, "v@:@");
        
        // 处理完
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}
@end
