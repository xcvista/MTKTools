//
//  NSData+MTKAES.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MTKAES)

/**
 Encrypt data with AES in CFB mode.
 
 @note Key length is determined from length of your input. Excessive key
 material is discarded.
 
 @warning You are responsible of generating and safeguarding the keys yourself.
 Bad key management or reuse of initialization vectors can compromise the system
 security.
 
 @param key Cryptographic key.
 @param iv  Initialization vector.
 
 @return Encrypted data.
 */
- (NSData *)dataByAESCFBEncryptWithKey:(NSData *)key initializationVector:(NSData *)iv;

/**
 Decrypt data with AES in CFB mode.
 
 @note Key length is determined from length of your input. Excessive key
 material is discarded.
 
 @warning You are responsible of generating and safeguarding the keys yourself.
 Bad key management or reuse of initialization vectors can compromise the system
 security.
 
 @param key Cryptographic key.
 @param iv  Initialization vector.
 
 @return Decrypted data.
 */
- (NSData *)dataByAESCFBDecryptWithKey:(NSData *)key initializationVector:(NSData *)iv;

/**
 Scramble data with AES in OFB mode.
 
 @note OFB mode decrypts itself with the same key and initialization vector.
 
 @note Key length is determined from length of your input. Excessive key
 material is discarded.
 
 @warning You are responsible of generating and safeguarding the keys yourself.
 Bad key management or reuse of initialization vectors can compromise the system
 security.
 
 @param key Cryptographic key.
 @param iv  Initialization vector.
 
 @return Scrambled data.
 */
- (NSData *)dataByAESOFBScrambleWithKey:(NSData *)key initializationVector:(NSData *)iv;

/**
 Scramble data with AES in CTR mode.
 
 @note CTR mode decrypts itself with the same key and initialization vector.
 
 @note Key length is determined from length of your input. Excessive key
 material is discarded.
 
 @warning You are responsible of generating and safeguarding the keys yourself.
 Bad key management or reuse of initialization vectors can compromise the system
 security.
 
 @param key Cryptographic key.
 @param iv  Initialization vector.
 
 @return Scrambled data.
 */
- (NSData *)dataByAESCTRScrambleWithKey:(NSData *)key initializationVector:(NSData *)iv;

@end
