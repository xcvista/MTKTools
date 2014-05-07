//
//  NSString+MTKRelativePath.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSString+MTKRelativePath.h"

@implementation NSString (MTKRelativePath)

- (NSString *)relativePathFromPath:(NSString *)base
{
    NSMutableArray *thisPath = [[self pathComponents] mutableCopy];
    NSMutableArray *basePath = [[base pathComponents] mutableCopy];
    
    while ([thisPath count] && [basePath count])
    {
        if ([thisPath[0] isEqual:basePath[0]])
        {
            [thisPath removeObjectAtIndex:0];
            [basePath removeObjectAtIndex:0];
        }
        else
        {
            break;
        }
    }
    
    NSString *ostr = @"";
    for (NSUInteger idx = 0; idx < [basePath count]; idx++)
        ostr = [ostr stringByAppendingPathComponent:@".."];
    
    for (NSString *part in thisPath)
        ostr = [ostr stringByAppendingPathComponent:part];
    
    return ostr;
}

@end
