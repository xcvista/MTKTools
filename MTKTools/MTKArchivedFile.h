//
//  MTKArchivedFile.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

__BEGIN_DECLS
/**
 Convert UNIX @c timespec to @c NSTimeInterval.
 */
NSTimeInterval MTKTimeIntervalFromTimeSpec(struct timespec time);

/**
 Convert @c NSTimeInterval to UNIX @c timespec.
 */
struct timespec MTKTimeSpecFromTimeInterval(NSTimeInterval interval);
__END_DECLS

/**
 @c MTKArchivedFile represents a single file in an archive.
 */
@interface MTKArchivedFile : NSObject

/**
 File name.
 */
@property NSString *fileName;

/**
 Modification time of file.
 */
@property NSDate *modificationTime;

/**
 Owner UID of the file.
 */
@property uid_t owner;

/**
 Owner GID of the file.
 */
@property gid_t groupOwner;

/**
 Mode of the file.
 */
@property mode_t fileMode;

/**
 Data of the file.
 */
@property NSData *data;

/**
 Initialize an @c MTKArchivedFile object from contents and properties of a file.
 
 @param file Path to the file in question.
 @param basePath Base path of the archive.
 
 @return The initialized object.
 */
- (id)initWithContentsOfFile:(NSString *)file relativeToPath:(NSString *)basePath;

/**
 Initialize an @c MTKArchivedFile object from contents and properties of a file
 at a given URL.
 
 @param file URL to the file in question.
@param basePath Base path of the archive.
 
 @return The initialized object.
 */
- (id)initWithContentsOfURL:(NSURL *)url relativeToPath:(NSURL *)basePath;

@end
