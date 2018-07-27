//
//  NSMutableArray+Safe.m
//  parkplus
//
//  Created by zhidao on 2017/5/8.
//  Copyright © 2017年 zhikun. All rights reserved.
//

#import "NSMutableArray+YZJSafe.h"
#import "NSObject+YZJSwizzled.h"

@implementation NSMutableArray (YZJSafe)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj yzj_swizzleMethod:@selector(addObject:) withMethod:@selector(yzj_safeAddObject:)];
        [obj yzj_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(yzj_safeObjectAtIndex:)];
        [obj yzj_swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(yzj_safeRemoveObjectAtIndex:)];
    });
}

- (void)yzj_safeAddObject:(id)anObject
{
    if (anObject) {
        [self yzj_safeAddObject:anObject];
    }else{
        NSAssert(anObject != nil, @"yzj_safeAddObject obj is nil");
    }
}

- (id)yzj_safeObjectAtIndex:(NSInteger)index
{
    if(index<[self count]){
        return [self yzj_safeObjectAtIndex:index];
    }else{
        NSAssert(index < [self count], @"yzj_safeObjectAtIndex index is Out of bounds");
    }
    return nil;
}

- (void)yzj_safeRemoveObjectAtIndex:(NSInteger)index
{
    if(index < [self count]){
        return [self yzj_safeRemoveObjectAtIndex:index];
    }else{
        NSAssert(index < [self count], @"yzj_safeRemoveObjectAtIndex index is Out of bounds");
    }
}

@end
