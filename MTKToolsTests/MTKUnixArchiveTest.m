//
//  MTKUnixArchiveTest.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKUnixArchiveTest : SenTestCase

@property NSData *archive;

@end

@implementation MTKUnixArchiveTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.archive = [@"!<arch>\n"
                     "test.txt        0           501   20    100644  8         `\n"
                     "testing\n"
                     "test2.txt       0           501   20    100644  5         `\n"
                     "test2\n" dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class. 
    [super tearDown];
}

- (void)testUnarchiving
{
    MTKUnixArchive *archive = [[MTKUnixArchive alloc] initWithArchiveData:self.archive];
    STAssertNotNil(archive, nil);
    STAssertEquals([[archive files] count], (NSUInteger)2, nil);
    
    MTKArchivedFile *test = [archive fileNamed:@"test.txt"];
    STAssertNotNil(test, nil);
    STAssertEqualObjects(test.fileName, @"test.txt", nil);
    STAssertEquals(test.modificationTime, [NSDate dateWithTimeIntervalSince1970:0], nil);
    STAssertEquals(test.owner, (uid_t)501, nil);
    STAssertEquals(test.groupOwner, (gid_t)20, nil);
    STAssertEquals(test.fileMode, (mode_t)0100644, nil);
    STAssertEqualObjects(test.data, [@"testing\n" dataUsingEncoding:NSUTF8StringEncoding], nil);
    
    MTKArchivedFile *test2 = [archive fileNamed:@"test2.txt"];
    STAssertNotNil(test2, nil);
    STAssertEqualObjects(test.data, [@"test2" dataUsingEncoding:NSUTF8StringEncoding], nil);
}

- (void)testArchiving
{
    MTKArchivedFile *test = [[MTKArchivedFile alloc] init];
    test.fileName = @"test.txt";
    test.modificationTime = [NSDate dateWithTimeIntervalSince1970:0];
    test.owner = 501;
    test.groupOwner = 20;
    test.fileMode = 0100644;
    test.data = [@"testing\n" dataUsingEncoding:NSUTF8StringEncoding];
    
    MTKArchivedFile *test2 = [[MTKArchivedFile alloc] init];
    test2.fileName = @"test2.txt";
    test2.modificationTime = [NSDate dateWithTimeIntervalSince1970:0];
    test2.owner = 501;
    test2.groupOwner = 20;
    test2.fileMode = 0100644;
    test2.data = [@"test2" dataUsingEncoding:NSUTF8StringEncoding];
    
    MTKUnixArchive *archive = [MTKUnixArchive archive];
    [archive addFile:test];
    [archive addFile:test2];
    
    STAssertEqualObjects([archive archiveData], self.archive, nil);
}

@end
