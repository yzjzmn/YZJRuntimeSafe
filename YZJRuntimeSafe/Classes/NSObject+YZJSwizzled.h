//
//  NSObject+Swizzled.h
//  YZJRuntime
//
//  Created by zhidao on 2017/5/10.
//  Copyright © 2017年 yzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Swizzled)

- (void)yzj_swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
