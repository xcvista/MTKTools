//
//  MTKUnixArchive.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MTKTools/MTKArchivedFile.h>

/**
 @c MTKUnixArchive class represents @c ar(1) format.
 */
@interface MTKUnixArchive : NSObject

@property (copy) NSArray *files;

- (id)initWithArchiveData:(NSData *)archive;

- (MTKArchivedFile *)fileNamed:(NSString *)name;
- (void)addFile:(MTKArchivedFile *)file;

- (NSData *)archiveData;

@end

@interface MTKUnixArchive (MTKExtendedArchive)

+ (instancetype)archive;
+ (instancetype)archiveWithContentsOfFile:(NSString *)file;
+ (instancetype)archiveWithContentsOfURL:(NSURL *)url;

- (id)initWithContentsOfFile:(NSString *)file;
- (id)initWithContentsOfURL:(NSURL *)url;

- (void)writeToFile:(NSString *)file atomically:(BOOL)atomically;
- (void)writeToURL:(NSURL *)url atomically:(BOOL)atomically;

@end

@interface MTKArchivedFile (MTKUnixArchive)

- (id)initWithUnixArchiveBinaryData:(const void *)data bytesUsed:(NSUInteger *)bytes;
- (NSData *)unixArchivedData;

@end
