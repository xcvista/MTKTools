//
//  NSData+MTKRandomBytes.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSData+MTKRandomBytes.h"
#import "NSData+MTKSecureHashing.h"

@implementation NSData (MTKRandomBytes)

+ (instancetype)randomDataWithLength:(NSUInteger)length
{
    if (length == 0)
        return [self data];
    
    int randfd = open("/dev/urandom", O_RDONLY);
    if (randfd < 0)
        return nil;
    
    NSMutableData *odata = [NSMutableData dataWithLength:length];
    if (read(randfd, [odata mutableBytes], length) < 0)
        return nil;
    
    close(randfd);
    return [self dataWithData:odata];
}

+ (instancetype)randomSecureDataWithLength:(NSUInteger)length
{
    if (length == 0)
        return [self data];
    
    int randfd = open("/dev/random", O_RDONLY);
    if (randfd < 0)
        return nil;
    
    uint8_t seed[16];
    if (read(randfd, &seed, 16) < 0)
        return nil;
    
    close(randfd);
    
    NSData *csprng = [NSData dataWithBytes:&seed length:16];
    csprng = [csprng SHA512Sum];
    NSMutableData *odata = [NSMutableData dataWithCapacity:length + 128];
    do
    {
        csprng = [csprng SHA512Sum];
        [odata appendData:csprng];
    } while ([odata length] < length);
    
    [odata setLength:length];
    return [self dataWithData:odata];
}

@end
