//
//  MTKArchive.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MTKArchivedFile;

/**
 Common methods of all archive formats.
 
 @note You should not instantiate this class. Use a concrete subclass like @c
 MTKUnixArchive instead.
 */
@interface MTKArchive : NSObject
{
    NSMutableArray *_files;
}

@property (copy) NSArray *files;

- (MTKArchivedFile *)fileNamed:(NSString *)name;
- (void)addFile:(MTKArchivedFile *)file;

+ (instancetype)archive;

@end
