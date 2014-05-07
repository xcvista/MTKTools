//
//  NSData+MTKMiniScramble.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSData+MTKMiniScramble.h"
#import "NSData+MTKHMAC.h"
#import "NSData+MTKBitwiseOperations.h"

@implementation NSData (MTKMiniScramble)

- (NSData *)dataByMiniScrambleWithKey:(NSData *)key initializationVector:(NSData *)iv
{
    NSData *ks = [iv SHA512HMACWithKey:key];
    NSMutableData *odata = [NSMutableData dataWithCapacity:[self length]];
    
    while ([odata length] < [self length])
    {
        @autoreleasepool
        {
            NSRange block = NSMakeRange([odata length], MIN([ks length], [self length] - [odata length]));
            NSData *blockData = [self subdataWithRange:block];
            [odata appendData:[blockData bitwiseXorWithData:ks]];
            ks = [ks SHA512HMACWithKey:key];
        }
    }
    
    return [odata copy];
}

@end
