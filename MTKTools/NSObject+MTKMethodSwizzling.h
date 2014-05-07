//
//  NSObject+MTKMethodSwizzling.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/8/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MTKMethodSwizzling)

/**
 Swap implementation of instance methods. (aka Method Swizzling)
 
 @param original Original method to be swapped.
 @param another  New method to be added.
 
 @return @c YES if swap is successful, @c NO if not.
 */
+ (BOOL)swapMethod:(SEL)original withMethod:(SEL)another;

/**
 Swap implementation of class methods. (aka Method Swizzling)
 
 @param original Original method to be swapped.
 @param another  New method to be added.
 
 @return @c YES if swap is successful, @c NO if not.
 */
+ (BOOL)swapClassMethod:(SEL)original withMethod:(SEL)another;

/**
 Add a new instance method to the class.
 
 @param method   Implementation of the new method.
 @param selector Selector for the method.
 @param encoding Method signature encoding.
 
 @return @c YES if the method is added, @c NO if not.
 */
+ (BOOL)addMethod:(IMP)method withSelector:(SEL)selector encoding:(const char *)encoding;

/**
 Add a new class method to the class.
 
 @param method   Implementation of the new method.
 @param selector Selector for the method.
 @param encoding Method signature encoding.
 
 @return @c YES if the method is added, @c NO if not.
 */
+ (BOOL)addClassMethod:(IMP)method withSelector:(SEL)selector encoding:(const char *)encoding;

@end
