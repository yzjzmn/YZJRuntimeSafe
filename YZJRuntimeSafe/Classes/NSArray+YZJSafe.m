//
//  NSArray+YZJSafe.m
//  Pods-YZJRuntimeSafe
//
//  Created by bimuyu on 2018/7/27.
//

#import "NSArray+YZJSafe.h"
#import "NSObject+YZJSwizzled.h"

@implementation NSArray (YZJSafe)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj yzj_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(yzj_safeObjectAtIndex:)];
    });
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


@end
