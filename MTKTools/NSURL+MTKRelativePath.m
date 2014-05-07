//
//  NSURL+MTKRelativePath.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSURL+MTKRelativePath.h"

@implementation NSURL (MTKRelativePath)

- (NSString *)relativePathFromURL:(NSURL *)base
{
    NSMutableArray *thisPath = [[self pathComponents] mutableCopy];
    NSMutableArray *basePath = [[base pathComponents] mutableCopy];
    
    if (![[self scheme] isEqualToString:[base scheme]] ||
        (![[self host] isEqualToString:[base host]] && [self host] != [base host]))
        return [self absoluteString];
    
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
