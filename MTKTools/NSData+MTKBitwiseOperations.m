//
//  NSData+MTKBitwiseOperations.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSData+MTKBitwiseOperations.h"

@implementation NSData (MTKBitwiseOperations)

- (NSData *)bitwiseAndWithData:(NSData *)data
{
    NSInteger length = MIN([self length], [data length]);
    NSMutableData *odata = [NSMutableData dataWithLength:length];
    
    const size_t *lsp1 = [self bytes];
    const size_t *lsp2 = [data bytes];
    size_t *ldp = [odata mutableBytes];
    
    for (; length >= sizeof(size_t); length -= sizeof(size_t))
    {
        *ldp++ = *lsp1++ & *lsp2++;
    }
    
    const uint8_t *csp1 = (const uint8_t *)lsp1;
    const uint8_t *csp2 = (const uint8_t *)lsp2;
    uint8_t *cdp = (uint8_t *)ldp;
    
    for (; length > 0; length--)
    {
        *cdp++ = *csp1++ & *csp2++;
    }
    
    return [odata copy];
}

- (NSData *)bitwiseOrWithData:(NSData *)data
{
    NSInteger length = MIN([self length], [data length]);
    NSMutableData *odata = [NSMutableData dataWithLength:length];
    
    const size_t *lsp1 = [self bytes];
    const size_t *lsp2 = [data bytes];
    size_t *ldp = [odata mutableBytes];
    
    for (; length >= sizeof(size_t); length -= sizeof(size_t))
    {
        *ldp++ = *lsp1++ | *lsp2++;
    }
    
    const uint8_t *csp1 = (const uint8_t *)lsp1;
    const uint8_t *csp2 = (const uint8_t *)lsp2;
    uint8_t *cdp = (uint8_t *)ldp;
    
    for (; length > 0; length--)
    {
        *cdp++ = *csp1++ | *csp2++;
    }
    
    return [odata copy];
}

- (NSData *)bitwiseXorWithData:(NSData *)data
{
    NSInteger length = MIN([self length], [data length]);
    NSMutableData *odata = [NSMutableData dataWithLength:length];
    
    const size_t *lsp1 = [self bytes];
    const size_t *lsp2 = [data bytes];
    size_t *ldp = [odata mutableBytes];
    
    for (; length >= sizeof(size_t); length -= sizeof(size_t))
    {
        *ldp++ = *lsp1++ ^ *lsp2++;
    }
    
    const uint8_t *csp1 = (const uint8_t *)lsp1;
    const uint8_t *csp2 = (const uint8_t *)lsp2;
    uint8_t *cdp = (uint8_t *)ldp;
    
    for (; length > 0; length--)
    {
        *cdp++ = *csp1++ ^ *csp2++;
    }
    
    return [odata copy];
}

- (NSData *)bitwiseNot
{
    NSInteger length = [self length];
    NSMutableData *odata = [NSMutableData dataWithLength:length];
    
    const size_t *lsp1 = [self bytes];
    size_t *ldp = [odata mutableBytes];
    
    for (; length >= sizeof(size_t); length -= sizeof(size_t))
    {
        *ldp++ = ~*lsp1++;
    }
    
    const uint8_t *csp1 = (const uint8_t *)lsp1;
    uint8_t *cdp = (uint8_t *)ldp;
    
    for (; length > 0; length--)
    {
        *cdp++ = ~*csp1++;
    }
    
    return [odata copy];
}

@end
