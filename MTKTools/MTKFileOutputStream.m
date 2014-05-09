//
//  MTKFileOutputStream.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/8/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "MTKFileOutputStream.h"

@implementation MTKFileOutputStream

- (id)initWithFileDescriptor:(int)fd
{
    if (!(self = [super init]))
        return nil;
    
    _fd = fd;
    return self;
}

- (NSInteger)write:(const uint8_t *)buffer maxLength:(NSUInteger)len
{
    return write(_fd, buffer, len);
}

- (BOOL)hasSpaceAvailable
{
    return YES;
}

@end
