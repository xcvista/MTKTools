//
//  NSData+MTKRandomBytes.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MTKRandomBytes)

/**
 @brief Generate a data object with cryptographically secure random bytes.
 
 This method generates random bytes by reading a seed from /dev/random and
 repeatedly applying SHA512 on it. The seed and first iteration is not used.
 
 This behavior is used to compensenate the limitation of the random device on
 Linux and uncertainty on OS X.
 
 @param length Length of the random output.
 
 @return Data with random bytes.
 */
+ (instancetype)randomSecureDataWithLength:(NSUInteger)length;

/**
 @brief Generate random data.
 
 The random data is generated by reading from /dev/urandom. This is usually not
 secure enough.
 
 @param length Length of the random output.
 
 @return Data with random bytes.
 */
+ (instancetype)randomDataWithLength:(NSUInteger)length;

@end
