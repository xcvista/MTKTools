//
//  NSObject+MTKKeyedEncoding.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/8/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "NSObject+MTKKeyedEncoding.h"

#import "NSObject+MTKKeyDiscovery.h"

@implementation NSObject (MTKKeyedEncoding)

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [self init]))
        return nil;
    
    if (![aDecoder allowsKeyedCoding])
        return self = nil;
    
    for (NSString *key in [self allKeys])
    {
        Class class = [self classForKey:key];
        id object;
        
        if (class)
            object = [aDecoder decodeObjectOfClass:class forKey:key];
        else
            object = [aDecoder decodeObjectForKey:key];
        
        if (object)
            [self setValue:object forKey:key];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (![aCoder allowsKeyedCoding])
        return;
    
    for (NSString *key in [self allKeys])
    {
        id object = [self valueForKey:key];
        
        if (object)
            [aCoder encodeObject:object forKey:key];
    }
}

@end
