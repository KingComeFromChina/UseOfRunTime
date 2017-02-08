//
//  UIImage+image.m
//  RunTimeDamo
//
//  Created by 王垒 on 2017/2/7.
//  Copyright © 2017年 王垒. All rights reserved.
//

#import "UIImage+image.h"

#import <objc/message.h>

@implementation UIImage (image)

// 加载这个分类时调用
+ (void)load{

    // 交换方法实现，方法都是定义在类里面
    // class_getMethodImplementation:获取方法实现
    // class_getInstanceMethod:获取对象
    // class_getClassMethod:获取类方法
    // IMP:方法实现
    
    // imageNamed
    // Class:获取哪个类方法
    // SEL:获取方法编号，根据SEL就能去找对应的类找方法
    Method imageNameMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    
    // wl_imageNamed
    Method wl_imageNameMethod = class_getClassMethod([UIImage class], @selector(wl_imageNamed:));
    
    // 交换方法
    method_exchangeImplementations(imageNameMethod, wl_imageNameMethod);
    
}

/*
 * 运行时
 * 先写一个其他方法，实现这个功能
 */

// 在分类里面不能调用super,分类木有父类
//+ (UIImage *)imageNamed:(NSString *)name
//{
//    [super im]
//}

+ (UIImage *)wl_imageNamed:(NSString *)imageName{

    // 1.加载图片
    UIImage *image = [UIImage wl_imageNamed:imageName];
    
    // 2.判断功能
    
    if (image == nil) {
        NSLog(@"加载image为空");
    }
    return image;
}

@end
