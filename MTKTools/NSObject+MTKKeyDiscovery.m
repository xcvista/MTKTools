//
//  NSObject+MTKKeyDiscovery.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSObject+MTKKeyDiscovery.h"

#import <objc/runtime.h>

@implementation NSObject (MTKKeyDiscovery)

- (NSArray *)allKeys
{
    unsigned count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    if (!properties)
        return @[];
    
    NSMutableArray *keys = [NSMutableArray arrayWithCapacity:count];
    
    for (NSUInteger idx = 0; idx < count; idx++)
    {
        [keys addObject:@(property_getName(properties[idx]))];
    }
    
    free(properties);
    
    return [keys copy];
}

- (Class)classForKey:(NSString *)key
{
    objc_property_t property = class_getProperty([self class], [key UTF8String]);
    
    if (!property)
        return nil;
    
    char *ctype = property_copyAttributeValue(property, "T");
    NSString *type = [[NSString alloc] initWithBytesNoCopy:ctype
                                                    length:strlen(ctype)
                                                  encoding:NSUTF8StringEncoding
                                              freeWhenDone:YES];
    
    switch (*ctype)
    {
        case '@':
            if ([type length] > 3)
            {
                return NSClassFromString([type substringWithRange:NSMakeRange(2, [type length] - 3)]);
            }
            else
            {
                return Nil;
            }
            break;
        case 'c':
        case 'i':
        case 's':
        case 'l':
        case 'q':
        case 'C':
        case 'I':
        case 'S':
        case 'L':
        case 'Q':
        case 'f':
        case 'd':
        case 'B':
            return [NSNumber class];
        default:
            return [NSValue class];
            break;
    }
    
    return Nil;
}

@end
