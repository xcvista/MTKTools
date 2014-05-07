//
//  MTKUnixArchive.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "MTKUnixArchive.h"

#import <ar.h>

@implementation MTKUnixArchive

- (id)initWithArchiveData:(NSData *)archive
{
    if (!(self = [self init]))
        return nil;
    
    const void *sp = [archive bytes];
    const void *ep = sp + [archive length];
    
    if (memcmp(sp, ARMAG, SARMAG))
        return self = nil;
    
    sp += SARMAG;
    
    while (sp < ep)
    {
        NSUInteger mlength = 0;
        MTKArchivedFile *file = [[MTKArchivedFile alloc] initWithUnixArchiveBinaryData:sp
                                                                          bufferLength:ep - sp
                                                                             bytesUsed:&mlength];
        if (file)
        {
            [_files addObject:file];
            sp += mlength;
        }
        else
            break;
    }
    
    return self;
}

- (NSData *)archiveData
{
    NSMutableData *odata = [NSMutableData dataWithBytes:ARMAG length:SARMAG];
    for (MTKArchivedFile *file in _files)
    {
        NSData *data = [file unixArchivedData];
        if (data)
            [odata appendData:data];
    };
    
    return [odata copy];
}

@end

@implementation MTKUnixArchive (MTKExtendedArchive)

- (id)initWithContentsOfFile:(NSString *)file
{
    return [self initWithArchiveData:[NSData dataWithContentsOfFile:file]];
}

- (id)initWithContentsOfURL:(NSURL *)url
{
    return [self initWithArchiveData:[NSData dataWithContentsOfURL:url]];
}

+ (instancetype)archiveWithContentsOfFile:(NSString *)file
{
    return [[self alloc] initWithArchiveData:[NSData dataWithContentsOfFile:file]];
}

+ (instancetype)archiveWithContentsOfURL:(NSURL *)url
{
    return [[self alloc] initWithArchiveData:[NSData dataWithContentsOfURL:url]];
}

- (BOOL)writeToFile:(NSString *)file atomically:(BOOL)atomically
{
    return [[self archiveData] writeToFile:file atomically:atomically];
}

- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically
{
    return [[self archiveData] writeToURL:url atomically:atomically];
}

@end

@implementation MTKArchivedFile (MTKUnixArchive)

- (id)initWithUnixArchiveBinaryData:(const void *)data bufferLength:(NSUInteger)length bytesUsed:(NSUInteger *)bytes
{
    const void *sp = data;
    
    if (!(self = [self init]))
        return nil;
    
    if (length < sizeof(struct ar_hdr))
        return self = nil;
    
    if (memcmp(((struct ar_hdr *)data)->ar_fmag, ARFMAG, 2))
        return self = nil;
    
    char name[20];
    time_t mtime;
    uid_t uid;
    gid_t gid;
    mode_t mode;
    size_t len;
    
    sscanf(data, "%16s%12ld%6u%6u%8ho%10lu", name, &mtime, &uid, &gid, &mode, &len);
    
    self.fileName = @(name);
    self.modificationTime = [NSDate dateWithTimeIntervalSince1970:mtime];
    self.owner = uid;
    self.groupOwner = gid;
    self.fileMode = mode;
    
    data += sizeof(struct ar_hdr);
    length -= sizeof(struct ar_hdr);
    
    if (length < len)
        return self = nil;
    
    self.data = [NSData dataWithBytes:data length:len];
    
    data += len;
    length -= len;
    
    NSUInteger moved = data - sp;
    
    if (len && (moved & 1))
        moved++;
    
    if (bytes)
        *bytes = moved;
    
    return self;
}

- (NSData *)unixArchivedData
{
    if ([self.fileName length] > 16)
        return nil;
    
    NSMutableData *odata = [NSMutableData dataWithCapacity:[self.data length] + sizeof(struct ar_hdr)];
    NSString *header = [NSString stringWithFormat:@"%-16s%-12ld%-6u%-6u%-8o%-10lu%-2s",
                        [self.fileName UTF8String],
                        (time_t)[self.modificationTime timeIntervalSince1970],
                        self.owner,
                        self.groupOwner,
                        self.fileMode,
                        [self.data length],
                        ARFMAG];
    
    [odata appendData:[header dataUsingEncoding:NSUTF8StringEncoding]];
    [odata appendData:[self data]];
    if ([odata length] & 1)
        [odata appendBytes:"\n" length:1];
    
    return [odata copy];
}

@end
