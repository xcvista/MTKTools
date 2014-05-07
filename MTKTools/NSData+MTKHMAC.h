//
//  NSData+MTKHMAC.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MTKHMAC)

- (NSData *)MD5HMACWithKey:(NSData *)key;
- (NSData *)SHA1HMACWithKey:(NSData *)key;
- (NSData *)SHA224HMACWithKey:(NSData *)key;
- (NSData *)SHA256HMACWithKey:(NSData *)key;
- (NSData *)SHA384HMACWithKey:(NSData *)key;
- (NSData *)SHA512HMACWithKey:(NSData *)key;

@end
