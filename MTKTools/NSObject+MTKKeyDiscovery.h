//
//  NSObject+MTKKeyDiscovery.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MTKKeyDiscovery)

/**
 Get all available keys of an object.
 
 @return All available keys.
 */
- (NSArray *)allKeys;

/**
 Get the class of a key.
 
 @param key Key to query.
 
 @return Class of the key.
 */
- (Class)classForKey:(NSString *)key;

@end
