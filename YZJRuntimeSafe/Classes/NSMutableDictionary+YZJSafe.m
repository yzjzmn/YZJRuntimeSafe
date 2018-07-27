//
//  NSMutableDictionary+Safe.m
//  YZJRuntime
//
//  Created by zhidao on 2017/5/10.
//  Copyright © 2017年 yzj. All rights reserved.
//

#import "NSMutableDictionary+YZJSafe.h"
#import "NSObject+YZJSwizzled.h"

@implementation NSMutableDictionary (YZJSafe)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj yzj_swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(yzj_safeSetObject:forKey:)];
    });
}


- (void)yzj_safeSetObject:(id)anObject forKey:(id)key
{
    if (anObject) {
        [self yzj_safeSetObject:anObject forKey:key];
    } else {
        NSAssert(anObject != nil, @"NSMutableDictionary yzj_safeSetObject obj is nil");
    }
}

@end
