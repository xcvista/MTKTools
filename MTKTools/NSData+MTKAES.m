//
//  NSData+MTKAES.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSData+MTKAES.h"

#if __has_include(<CommonCrypto/CommonCryptor.h>)
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (MTKAES)

- (NSData *)dataByAESCFBEncryptWithKey:(NSData *)key initializationVector:(NSData *)iv
{
    // Key preparing: bail if too short, cut if too long.
    NSMutableData *ikey = [key mutableCopy];
    if ([ikey length] < 16)
        return nil;
    else if ([ikey length] < 24)
        [ikey setLength:16];
    else if ([ikey length] < 32)
        [ikey setLength:24];
    else
        [ikey setLength:32];
    
    // IV preparing: bail if too short, cut if too long.
    NSMutableData *iiv = [iv mutableCopy];
    if ([iiv length] < 16)
        return nil;
    else
        [iiv setLength:16];
    
    CCCryptorRef cryptor;
    
    CCCryptorCreateWithMode(kCCEncrypt, kCCModeCFB, kCCAlgorithmAES, ccNoPadding, [iiv bytes], [ikey bytes], [ikey length], NULL, 0, 0, 0, &cryptor);
    
    NSMutableData *odata = [NSMutableData dataWithLength:CCCryptorGetOutputLength(cryptor, [self length], true)];
    void *cp = [odata mutableBytes];
    size_t len = 0;
    
    CCCryptorUpdate(cryptor, [self bytes], [self length], cp, [odata length], &len);
    cp += len;
    
    CCCryptorFinal(cryptor, cp, [odata length] - len, &len);
    
    CCCryptorRelease(cryptor);
    
    return [odata copy];
}

- (NSData *)dataByAESCFBDecryptWithKey:(NSData *)key initializationVector:(NSData *)iv
{
    // Key preparing: bail if too short, cut if too long.
    NSMutableData *ikey = [key mutableCopy];
    if ([ikey length] < 16)
        return nil;
    else if ([ikey length] < 24)
        [ikey setLength:16];
    else if ([ikey length] < 32)
        [ikey setLength:24];
    else
        [ikey setLength:32];
    
    // IV preparing: bail if too short, cut if too long.
    NSMutableData *iiv = [iv mutableCopy];
    if ([iiv length] < 16)
        return nil;
    else
        [iiv setLength:16];
    
    CCCryptorRef cryptor;
    
    CCCryptorCreateWithMode(kCCDecrypt, kCCModeCFB, kCCAlgorithmAES, ccNoPadding, [iiv bytes], [ikey bytes], [ikey length], NULL, 0, 0, 0, &cryptor);
    
    NSMutableData *odata = [NSMutableData dataWithLength:CCCryptorGetOutputLength(cryptor, [self length], true)];
    void *cp = [odata mutableBytes];
    size_t len = 0;
    
    CCCryptorUpdate(cryptor, [self bytes], [self length], cp, [odata length], &len);
    cp += len;
    
    CCCryptorFinal(cryptor, cp, [odata length] - len, &len);
    
    CCCryptorRelease(cryptor);
    
    return [odata copy];
}

- (NSData *)dataByAESOFBScrambleWithKey:(NSData *)key initializationVector:(NSData *)iv
{
    // Key preparing: bail if too short, cut if too long.
    NSMutableData *ikey = [key mutableCopy];
    if ([ikey length] < 16)
        return nil;
    else if ([ikey length] < 24)
        [ikey setLength:16];
    else if ([ikey length] < 32)
        [ikey setLength:24];
    else
        [ikey setLength:32];
    
    // IV preparing: bail if too short, cut if too long.
    NSMutableData *iiv = [iv mutableCopy];
    if ([iiv length] < 16)
        return nil;
    else
        [iiv setLength:16];
    
    CCCryptorRef cryptor;
    
    CCCryptorCreateWithMode(kCCEncrypt, kCCModeOFB, kCCAlgorithmAES, ccNoPadding, [iiv bytes], [ikey bytes], [ikey length], NULL, 0, 0, 0, &cryptor);
    
    NSMutableData *odata = [NSMutableData dataWithLength:CCCryptorGetOutputLength(cryptor, [self length], true)];
    void *cp = [odata mutableBytes];
    size_t len = 0;
    
    CCCryptorUpdate(cryptor, [self bytes], [self length], cp, [odata length], &len);
    cp += len;
    
    CCCryptorFinal(cryptor, cp, [odata length] - len, &len);
    
    CCCryptorRelease(cryptor);
    
    return [odata copy];
}

- (NSData *)dataByAESCTRScrambleWithKey:(NSData *)key initializationVector:(NSData *)iv
{
    // Key preparing: bail if too short, cut if too long.
    NSMutableData *ikey = [key mutableCopy];
    if ([ikey length] < 16)
        return nil;
    else if ([ikey length] < 24)
        [ikey setLength:16];
    else if ([ikey length] < 32)
        [ikey setLength:24];
    else
        [ikey setLength:32];
    
    // IV preparing: bail if too short, cut if too long.
    NSMutableData *iiv = [iv mutableCopy];
    if ([iiv length] < 16)
        return nil;
    else
        [iiv setLength:16];
    
    CCCryptorRef cryptor;
    
    CCCryptorCreateWithMode(kCCEncrypt, kCCModeCTR, kCCAlgorithmAES, ccNoPadding, [iiv bytes], [ikey bytes], [ikey length], NULL, 0, 0, kCCModeOptionCTR_BE, &cryptor);
    
    NSMutableData *odata = [NSMutableData dataWithLength:CCCryptorGetOutputLength(cryptor, [self length], true)];
    void *cp = [odata mutableBytes];
    size_t len = 0;
    
    CCCryptorUpdate(cryptor, [self bytes], [self length], cp, [odata length], &len);
    cp += len;
    
    CCCryptorFinal(cryptor, cp, [odata length] - len, &len);
    
    CCCryptorRelease(cryptor);
    
    return [odata copy];
}

@end

#else
#import <openssl/aes.h>

@implementation NSData (MTKAES)

- (NSData *)dataByAESCFBEncryptWithKey:(NSData *)key initializationVector:(NSData *)iv
{
    // Key preparing: bail if too short, cut if too long.
    NSMutableData *ikey = [key mutableCopy];
    if ([ikey length] < 16)
        return nil;
    else if ([ikey length] < 24)
        [ikey setLength:16];
    else if ([ikey length] < 32)
        [ikey setLength:24];
    else
        [ikey setLength:32];
    
    AES_KEY aes_key;
    AES_set_encrypt_key([ikey bytes], (int)[ikey length], &aes_key);
    
    // IV preparing: bail if too short, cut if too long.
    NSMutableData *iiv = [iv mutableCopy];
    if ([iiv length] < 16)
        return nil;
    else
        [iiv setLength:16];
    
    int num = 0;
    
    NSMutableData *odata = [NSMutableData dataWithLength:[self length]];
    AES_cfb128_encrypt([self bytes], [odata mutableBytes], [self length],
                       &aes_key, [iiv mutableBytes], &num, AES_ENCRYPT);
    
    return [odata copy];
}

- (NSData *)dataByAESCFBDecryptWithKey:(NSData *)key initializationVector:(NSData *)iv
{
    // Key preparing: bail if too short, cut if too long.
    NSMutableData *ikey = [key mutableCopy];
    if ([ikey length] < 16)
        return nil;
    else if ([ikey length] < 24)
        [ikey setLength:16];
    else if ([ikey length] < 32)
        [ikey setLength:24];
    else
        [ikey setLength:32];
    
    AES_KEY aes_key;
    AES_set_decrypt_key([ikey bytes], (int)[ikey length], &aes_key);
    
    // IV preparing: bail if too short, cut if too long.
    NSMutableData *iiv = [iv mutableCopy];
    if ([iiv length] < 16)
        return nil;
    else
        [iiv setLength:16];
    
    int num = 0;
    
    NSMutableData *odata = [NSMutableData dataWithLength:[self length]];
    AES_cfb128_encrypt([self bytes], [odata mutableBytes], [self length],
                       &aes_key, [iiv mutableBytes], &num, AES_DECRYPT);
    
    return [odata copy];
}

- (NSData *)dataByAESOFBScrambleWithKey:(NSData *)key initializationVector:(NSData *)iv
{
    // Key preparing: bail if too short, cut if too long.
    NSMutableData *ikey = [key mutableCopy];
    if ([ikey length] < 16)
        return nil;
    else if ([ikey length] < 24)
        [ikey setLength:16];
    else if ([ikey length] < 32)
        [ikey setLength:24];
    else
        [ikey setLength:32];
    
    AES_KEY aes_key;
    AES_set_encrypt_key([ikey bytes], (int)[ikey length], &aes_key);
    
    // IV preparing: bail if too short, cut if too long.
    NSMutableData *iiv = [iv mutableCopy];
    if ([iiv length] < 16)
        return nil;
    else
        [iiv setLength:16];
    
    int num = 0;
    
    NSMutableData *odata = [NSMutableData dataWithLength:[self length]];
    AES_ofb128_encrypt([self bytes], [odata mutableBytes], [self length], &aes_key, [iiv mutableBytes], &num);
    
    return [odata copy];
}

- (NSData *)dataByAESCTRScrambleWithKey:(NSData *)key initializationVector:(NSData *)iv
{
    // Key preparing: bail if too short, cut if too long.
    NSMutableData *ikey = [key mutableCopy];
    if ([ikey length] < 16)
        return nil;
    else if ([ikey length] < 24)
        [ikey setLength:16];
    else if ([ikey length] < 32)
        [ikey setLength:24];
    else
        [ikey setLength:32];
    
    AES_KEY aes_key;
    AES_set_encrypt_key([ikey bytes], (int)[ikey length], &aes_key);
    
    // IV preparing: bail if too short, cut if too long.
    NSMutableData *iiv = [iv mutableCopy];
    if ([iiv length] < 16)
        return nil;
    else
        [iiv setLength:16];
    
    NSMutableData *counter = [NSMutableData dataWithLength:16];
    
    int num = 0;
    
    NSMutableData *odata = [NSMutableData dataWithLength:[self length]];
    AES_ctr128_encrypt([self bytes], [odata mutableBytes], [self length], &aes_key, [iiv mutableBytes], [counter mutableBytes], &num);
    
    return [odata copy];
}

@end

#endif
