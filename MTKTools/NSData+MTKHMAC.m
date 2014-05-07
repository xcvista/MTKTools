//
//  NSData+MTKHMAC.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSData+MTKHMAC.h"

#if __has_include(<CommonCrypto/CommonHMAC.h>)
#import <CommonCrypto/CommonHMAC.h>

#define EVP_md5()
#define EVP_sha1()
#define EVP_sha224()
#define EVP_sha256()
#define EVP_sha384()
#define EVP_sha512()

#define HMACIMP(_alg, _evp) \
- (NSData *)_alg ##HMACWithKey:(NSData *)key \
{ \
    NSMutableData *odata = [NSMutableData dataWithLength:CC_ ##_alg ##_DIGEST_LENGTH]; \
    CCHmac(kCCHmacAlg ##_alg, \
           [key bytes], [key length], \
           [self bytes], [self length], \
           [odata mutableBytes]); \
    return [odata copy]; \
}
#else
#import <openssl/hmac.h>

#define HMACIMP(_alg, _evp) \
- (NSData *)_alg ##HMACWithKey:(NSData *)key \
{ \
    uint8_t mdbuf[HMAC_MAX_MD_CBLOCK]; \
    unsigned len = 0; \
     \
    HMAC(_evp, [key bytes], (int)[key length], [self bytes], [self length], mdbuf, &len); \
    if (len > 0) \
        return [NSData dataWithBytes:mdbuf length:len]; \
    else \
        return nil; \
}
#endif

@implementation NSData (MTKHMAC)

HMACIMP(MD5, EVP_md5())
HMACIMP(SHA1, EVP_sha1())
HMACIMP(SHA224, EVP_sha224())
HMACIMP(SHA256, EVP_sha256())
HMACIMP(SHA384, EVP_sha384())
HMACIMP(SHA512, EVP_sha512())

@end
