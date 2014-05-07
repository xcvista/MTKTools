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

/**
 All files in the archive.
 */
@property (copy) NSArray *files;

/**
 Get the first file in the archive with the given name.
 
 @param name Name of the file in the archive.
 
 @return The first file with the name, @c nil if not found.
 */
- (MTKArchivedFile *)fileNamed:(NSString *)name;

/**
 Add a file to the end of the archive.
 
 @note Adding file with this method does not check if a file with the same name
 exists in the archive. This may be desired behavior for some archive format.
 
 @param file File to be added
 
 @see @c -replaceFile:
 */
- (void)addFile:(MTKArchivedFile *)file;

/**
 Replace the first file with the same name, or add it to the end if not found.
 
 @param file File to replace.
 */
- (void)replaceFile:(MTKArchivedFile *)file;

/**
 Create a new, empty archive.
 
 @return The new archive.
 */
+ (instancetype)archive;

@end
