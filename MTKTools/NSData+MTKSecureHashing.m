//
//  NSData+MTKSecureHashing.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSData+MTKSecureHashing.h"

#if __has_include(<CommonCrypto/CommonDigest.h>)
#import <CommonCrypto/CommonDigest.h>

#define SUMIMP(_alg) \
- (NSData *)_alg ##Sum \
{ \
    NSMutableData *odata = [NSMutableData dataWithLength:CC_ ##_alg ##_DIGEST_LENGTH]; \
    if (!CC_##_alg([self bytes], (CC_LONG)[self length], [odata mutableBytes])) \
        return nil; \
    return [odata copy]; \
}
#else
#import <openssl/sha.h>
#import <openssl/md2.h>
#import <openssl/md4.h>
#import <openssl/md5.h>

#define SHA1_DIGEST_LENGTH SHA_DIGEST_LENGTH

#define SUMIMP(_alg) \
- (NSData *)_alg ##Sum \
{ \
NSMutableData *odata = [NSMutableData dataWithLength:_alg ##_DIGEST_LENGTH]; \
if (!_alg([self bytes], [self length], [odata mutableBytes])) \
return nil; \
return [odata copy]; \
}

#endif

@implementation NSData (MTKSecureHashing)

SUMIMP(MD2)
SUMIMP(MD4)
SUMIMP(MD5)
SUMIMP(SHA1)
SUMIMP(SHA224)
SUMIMP(SHA256)
SUMIMP(SHA384)
SUMIMP(SHA512)

@end
