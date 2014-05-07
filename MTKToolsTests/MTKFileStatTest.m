//
//  MTKFileStatTest.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKFileStatTest : SenTestCase

@property NSURL *temporaryRoot;

@end

@implementation MTKFileStatTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // We will need a temporary directory.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    self.temporaryRoot = [NSURL fileURLWithPath:[NSTemporaryDirectory()
                                                 stringByAppendingPathComponent:[[NSProcessInfo processInfo] globallyUniqueString]]
                                    isDirectory:YES];
    [fileManager createDirectoryAtURL:self.temporaryRoot
          withIntermediateDirectories:YES
                           attributes:nil
                                error:NULL];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class. 
    [super tearDown];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtURL:self.temporaryRoot error:NULL];
}

- (void)testStandardFile
{
    NSString *contents = @"test";
    NSURL *filePath = [self.temporaryRoot URLByAppendingPathComponent:@"test.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [contents writeToURL:filePath
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:NULL];
    
    MTKArchivedFile *archive = [[MTKArchivedFile alloc] initWithContentsOfURL:filePath relativeToPath:self.temporaryRoot];
    STAssertNotNil(archive, nil);
    STAssertTrue(archive.fileMode & S_IFREG, nil);
    STAssertEqualObjects(archive.data, [contents dataUsingEncoding:NSUTF8StringEncoding], nil);
    
    [fileManager removeItemAtURL:filePath error:NULL];
}

- (void)testDirectory
{
    NSURL *filePath = [self.temporaryRoot URLByAppendingPathComponent:@"test.d" isDirectory:YES];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [fileManager createDirectoryAtURL:filePath
          withIntermediateDirectories:YES
                           attributes:nil
                                error:NULL];
    
    MTKArchivedFile *archive = [[MTKArchivedFile alloc] initWithContentsOfURL:filePath relativeToPath:self.temporaryRoot];
    STAssertNotNil(archive, nil);
    STAssertTrue(archive.fileMode & S_IFDIR, nil);
    STAssertNil(archive.data, nil);
    
    [fileManager removeItemAtURL:filePath error:NULL];
}

- (void)testSymlink
{
    NSURL *filePath = [self.temporaryRoot URLByAppendingPathComponent:@"bash" isDirectory:YES];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [fileManager createSymbolicLinkAtURL:filePath
                      withDestinationURL:[NSURL fileURLWithPath:@"/bin/bash"]
                                   error:NULL];
    
    MTKArchivedFile *archive = [[MTKArchivedFile alloc] initWithContentsOfURL:filePath relativeToPath:self.temporaryRoot];
    STAssertNotNil(archive, nil);
    STAssertTrue(archive.fileMode & S_IFLNK, nil);
    STAssertEqualObjects(archive.data, [@"/bin/bash" dataUsingEncoding:NSUTF8StringEncoding], nil);
    
    [fileManager removeItemAtURL:filePath error:NULL];
}

- (void)testSpecialFile
{
    NSURL *filePath = [NSURL fileURLWithPath:@"/dev/null"];
    
    MTKArchivedFile *archive = [[MTKArchivedFile alloc] initWithContentsOfURL:filePath relativeToPath:self.temporaryRoot];
    STAssertNil(archive, nil);
}

@end
