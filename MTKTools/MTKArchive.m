//
//  MTKArchive.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import "MTKArchive.h"
#import "MTKArchivedFile.h"

@implementation MTKArchive

- (NSArray *)files
{
    @synchronized (self)
    {
        return [_files copy];
    }
}

- (void)setFiles:(NSArray *)files
{
    @synchronized (self)
    {
        _files = [files mutableCopy];
    }
}

- (id)init
{
    if (!(self = [super init]))
        return nil;
    
    _files = [NSMutableArray array];
    return self;
}

+ (instancetype)archive
{
    return [[self alloc] init];
}

- (MTKArchivedFile *)fileNamed:(NSString *)name
{
    @synchronized (self)
    {
        for (MTKArchivedFile *file in _files)
            if ([file.fileName isEqualToString:name])
                return file;
        return nil;
    }
}

- (void)addFile:(MTKArchivedFile *)file
{
    @synchronized (self)
    {
        [_files addObject:file];
    }
}

@end
