//
//  NSData+MTKMiniScramble.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MTKMiniScramble)

/**
 Scramble data with SHA512-HMAC in OFB mode.
 
 @warning This algorithm is not proved and slow. Use at your own risk.
 
 @note OFB mode decrypts itself with the same key and initialization vector.
 
 @warning You are responsible of generating and safeguarding the keys yourself.
 Bad key management or reuse of initialization vectors can compromise the system
 security.
 
 @param key Cryptographic key.
 @param iv  Initialization vector.
 
 @return Scrambled data.
 */
- (NSData *)dataByMiniScrambleWithKey:(NSData *)key initializationVector:(NSData *)iv;

@end
