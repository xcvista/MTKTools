//
//  MTKFileInputStream.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @c MTKFileInputStream is an @c NSInputStream that wraps around a file handler.
 */
@interface MTKFileInputStream : NSInputStream

/**
 Initialized the new @c MTKFileInputStream object.
 
 @param fd File descriptor.
 
 @return The initialized file descriptor.
 */
- (id)initWithFileHandler:(int)fd;

@end
