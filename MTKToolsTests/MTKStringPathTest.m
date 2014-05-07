//
//  MTKStringPathTest.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKStringPathTest : SenTestCase

@end

@implementation MTKStringPathTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class. 
    [super tearDown];
}

- (void)testStringMakeRelative
{
    NSString *base = @"/usr/local";
    
    NSString *abs1 = @"/usr/local/bin/ohttpd";
    NSString *rel1 = @"bin/ohttpd";
    STAssertEqualObjects([abs1 relativePathFromPath:base], rel1, nil);
    
    NSString *abs2 = @"/usr/bin/find";
    NSString *rel2 = @"../bin/find";
    STAssertEqualObjects([abs2 relativePathFromPath:base], rel2, nil);
}

- (void)testURLMakeRelative
{
    NSURL *base = [NSURL fileURLWithPath:@"/usr/local"];
    
    NSURL *abs1 = [NSURL fileURLWithPath:@"/usr/local/bin/ohttpd"];
    NSString *rel1 = @"bin/ohttpd";
    STAssertEqualObjects([abs1 relativePathFromURL:base], rel1, nil);
    
    NSURL *abs2 = [NSURL fileURLWithPath:@"/usr/bin/find"];
    NSString *rel2 = @"../bin/find";
    STAssertEqualObjects([abs2 relativePathFromURL:base], rel2, nil);
}

@end
