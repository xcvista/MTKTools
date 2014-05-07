//
//  NSData+MTKBitwiseOperations.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MTKBitwiseOperations)

/**
 Bitwise AND two data objects.
 
 @param data The ohter data object.
 
 @return The bitwise AND of the two data objects. The output has the same length
 as the shorter of the two data objects.
 */
- (NSData *)bitwiseAndWithData:(NSData *)data;

/**
 Bitwise OR two data objects.
 
 @param data The ohter data object.
 
 @return The bitwise OR of the two data objects. The output has the same length
 as the shorter of the two data objects.
 */
- (NSData *)bitwiseOrWithData:(NSData *)data;

/**
 Bitwise NOT the data object.
 
 @return The bitwise NOT of the data object.
 */
- (NSData *)bitwiseNot;

/**
 Bitwise XOR two data objects.
 
 @param data The ohter data object.
 
 @return The bitwise AND of the two data objects. The output has the same length
 as the shorter of the two data objects.
 */
- (NSData *)bitwiseXorWithData:(NSData *)data;

@end
