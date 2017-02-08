//
//  NSObject+objc.m
//  RunTimeDamo
//
//  Created by 王垒 on 2017/2/8.
//  Copyright © 2017年 王垒. All rights reserved.
//

#import "NSObject+objc.h"
#import <objc/message.h>

// static NSString *_name;
@implementation NSObject (objc)

- (void)setName:(NSString *)name{

   // _name = name;
    /*
     *  objc_setAssociatedObject(<#id object#>, <#const void *key#>, <#id value#>, <#objc_AssociationPolicy policy#>)
     *  添加属性和对象
     *  给某个对象产生关联，添加属性
     *  object:添加属性的对象
     *  key:属性名，根据key去获取关联对象,void * == id
     *  value:关联的值
     *  policy:策略
     */
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 这样子也可以的
//    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name{

    return objc_getAssociatedObject(self, @"name");
}

@end
