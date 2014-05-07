//
//  NSObject+MTKMethodSwizzling.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/8/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSObject+MTKMethodSwizzling.h"

#import <objc/runtime.h>

static inline BOOL _MTKSwapMethods(Class class, SEL original, SEL another)
{
    Method orig = class_getInstanceMethod(class, original);
    Method anot = class_getInstanceMethod(class, another);
    
    BOOL didAddMethod = class_addMethod(class,
                                        original,
                                        method_getImplementation(anot),
                                        method_getTypeEncoding(anot));
    
    if (didAddMethod)
    {
        class_replaceMethod(class,
                            another,
                            method_getImplementation(orig),
                            method_getTypeEncoding(orig));
    }
    else
    {
        method_exchangeImplementations(orig, anot);
    }
    
    return YES;
}

@implementation NSObject (MTKMethodSwizzling)

+ (BOOL)swapMethod:(SEL)original withMethod:(SEL)another
{
    return _MTKSwapMethods(self, original, another);
}

+ (BOOL)swapClassMethod:(SEL)original withMethod:(SEL)another
{
    return _MTKSwapMethods(object_getClass((id)self), original, another);
}

+ (BOOL)addMethod:(IMP)method withSelector:(SEL)selector encoding:(const char *)encoding
{
    return class_addMethod(self, selector, method, encoding);
}

+ (BOOL)addClassMethod:(IMP)method withSelector:(SEL)selector encoding:(const char *)encoding
{
    return class_addMethod(object_getClass((id)self), selector, method, encoding);
}

@end
