//
//  MTKArchivedFile.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "MTKArchivedFile.h"
#import "NSString+MTKRelativePath.h"

#import <sys/stat.h>

NSTimeInterval MTKTimeIntervalFromTimeSpec(struct timespec time)
{
    NSTimeInterval t = (NSTimeInterval)time.tv_sec;
    t += (NSTimeInterval)time.tv_nsec / 1e-9;
    return t;
}

struct timespec MTKTimeSpecFromTimeInterval(NSTimeInterval interval)
{
    struct timespec tv;
    tv.tv_sec = interval;
    interval -= tv.tv_sec;
    tv.tv_nsec = interval * 1e+9;
    return tv;
}

@implementation MTKArchivedFile

- (id)initWithContentsOfFile:(NSString *)file relativeToPath:(NSString *)basePath
{
    if (!(self = [super init]))
        return nil;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:file])
        return self = nil;
    
    self.fileName = [file relativePathFromPath:basePath];
    
    struct stat st;
    if (lstat([file UTF8String], &st))
        return self = nil;
    
    self.fileMode = st.st_mode & 0777;
    self.owner = st.st_uid;
    self.groupOwner = st.st_gid;
    self.modificationTime = [NSDate dateWithTimeIntervalSince1970:MTKTimeIntervalFromTimeSpec(st.st_mtimespec)];
    
    // Only directories, files and symlinks allowed
    if ((st.st_mode & S_IFLNK) == S_IFLNK)
    {
        // Symlink.
        self.fileMode |= S_IFLNK;
        NSMutableData *buf = [NSMutableData dataWithLength:4096];
        ssize_t len = readlink([file UTF8String], [buf mutableBytes], 4096);
        if (len < 0)
            return self = nil;
        [buf setLength:len];
        self.data = buf;
    }
    else if ((st.st_mode & S_IFREG) == S_IFREG)
    {
        // Regular file.
        self.fileMode |= S_IFREG;
        self.data = [NSData dataWithContentsOfFile:file];
    }
    else if ((st.st_mode & S_IFDIR) == S_IFDIR)
    {
        // Directory.
        self.fileMode |= S_IFDIR;
        self.data = nil;
    }
    else
    {
        return self = nil;
    }
    
    return self;
}

- (id)initWithContentsOfURL:(NSURL *)url relativeToPath:(NSURL *)basePath
{
    if ([[url scheme] hasPrefix:@"file"] && [[basePath scheme] hasPrefix:@"file"])
        return [self initWithContentsOfFile:[url path] relativeToPath:[basePath path]];
    else
        return self = nil;
}

@end
