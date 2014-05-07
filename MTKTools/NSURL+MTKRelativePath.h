//
//  NSURL+MTKRelativePath.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (MTKRelativePath)

/**
 Get the relative path from a base path.
 
 @param base Base path.
 
 @return The relative path.
 */
- (NSString *)relativePathFromURL:(NSURL *)base;

@end
