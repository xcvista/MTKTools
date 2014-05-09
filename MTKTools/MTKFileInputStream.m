//
//  MTKFileInputStream.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "MTKFileInputStream.h"

@implementation MTKFileInputStream

- (id)initWithFileDescriptor:(int)fd
{
    if (!(self = [super init]))
        return nil;
    
    _fd = fd;
    return self;
}

- (NSInteger)read:(uint8_t *)buffer maxLength:(NSUInteger)len
{
    return read(_fd, buffer, len);
}

- (BOOL)getBuffer:(uint8_t **)buffer length:(NSUInteger *)len
{
    return NO;
}

- (BOOL)hasBytesAvailable
{
    return YES;
}

@end
