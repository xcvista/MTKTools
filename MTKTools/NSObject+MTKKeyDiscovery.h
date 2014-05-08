//
//  NSObject+MTKKeyDiscovery.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Overrides class of a key when detecting. This macro expands into an instance
 method definition.
 
 @warning For coders that does not support arbitiary object coding, encoding an
 object that does not explicitly support coding with class hints will be
 problematic.
 
 @param _key   The key to be overridden.
 @param _class The class it should return.
 */
#define MTKClassForKey(_key, _class) \
- (Class)classForKey ##_key { \
    return [_class class]; \
}

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
