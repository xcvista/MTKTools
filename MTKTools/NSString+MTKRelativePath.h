//
//  NSString+MTKRelativePath.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MTKRelativePath)

/**
 Get the relative path from a base path.
 
 @param base Base path.
 
 @return The relative path.
 */
- (NSString *)relativePathFromPath:(NSString *)base;

@end
