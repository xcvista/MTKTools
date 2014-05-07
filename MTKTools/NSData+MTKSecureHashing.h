//
//  NSData+MTKSecureHashing.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MTKSecureHashing)

/**
 Computes MD2 of the data.
 
 @warning MD2 is cryptographically broken.
 
 @return The MD2 of the data.
 */
- (NSData *)MD2Sum;

/**
 Computes MD4 of the data.
 
 @warning MD4 is cryptographically broken.
 
 @return The MD4 of the data.
 */
- (NSData *)MD4Sum;

/**
 Computes MD5 of the data.
 
 @warning MD5 is cryptographically broken.
 
 @return The MD5 of the data.
 */
- (NSData *)MD5Sum;

/**
 Computes SHA1 of the data.
 
 @warning SHA1 is cryptographically broken.
 
 @return The SHA1 of the data.
 */
- (NSData *)SHA1Sum;

/**
 Computes SHA224 of the data.
 
 @return The SHA224 of the data.
 */
- (NSData *)SHA224Sum;

/**
 Computes SHA256 of the data.
 
 @return The SHA256 of the data.
 */
- (NSData *)SHA256Sum;

/**
 Computes SHA384 of the data.
 
 @return The SHA384 of the data.
 */
- (NSData *)SHA384Sum;

/**
 Computes SHA512 of the data.
 
 @return The SHA512 of the data.
 */
- (NSData *)SHA512Sum;

@end
