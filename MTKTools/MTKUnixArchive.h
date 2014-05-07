//
//  MTKUnixArchive.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <MTKTools/MTKArchive.h>
#import <MTKTools/MTKArchivedFile.h>

/**
 @c MTKUnixArchive class represents @c ar(1) format.
 */
@interface MTKUnixArchive : MTKArchive

- (id)initWithArchiveData:(NSData *)archive;

- (NSData *)archiveData;

@end

@interface MTKUnixArchive (MTKExtendedArchive)

+ (instancetype)archiveWithContentsOfFile:(NSString *)file;
+ (instancetype)archiveWithContentsOfURL:(NSURL *)url;

- (id)initWithContentsOfFile:(NSString *)file;
- (id)initWithContentsOfURL:(NSURL *)url;

- (BOOL)writeToFile:(NSString *)file atomically:(BOOL)atomically;
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically;

@end

@interface MTKArchivedFile (MTKUnixArchive)

- (id)initWithUnixArchiveBinaryData:(const void *)data
                       bufferLength:(NSUInteger)length
                          bytesUsed:(NSUInteger *)bytes;
- (NSData *)unixArchivedData;

@end
