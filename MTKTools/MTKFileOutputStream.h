//
//  MTKFileOutputStream.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/8/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @c MTKOutputInputStream is an @c NSOutputStream that wraps around a file
 handler.
 */
@interface MTKFileOutputStream : NSOutputStream
{
    int _fd;
}

/**
 Initialized the new @c MTKFileOutputStream object.
 
 @param fd File descriptor.
 
 @return The initialized stream.
 */
- (id)initWithFileDescriptor:(int)fd;

@end
