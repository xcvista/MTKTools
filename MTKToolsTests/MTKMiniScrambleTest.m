//
//  MTKMiniScrambleTest.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKMiniScrambleTest : SenTestCase

@end

@implementation MTKMiniScrambleTest

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

- (void)testMiniScramble
{
    NSData *content = [NSData randomSecureDataWithLength:2048];
    NSData *key = [NSData randomSecureDataWithLength:64];
    NSData *iv = [NSData randomSecureDataWithLength:64];
    
    // Encrypt
    NSData *encrypted = [content dataByMiniScrambleWithKey:key initializationVector:iv];
    STAssertNotNil(encrypted, nil);
    STAssertEquals([content length], [encrypted length], nil);
    
    // Decrypt
    NSData *decrypted = [encrypted dataByMiniScrambleWithKey:key initializationVector:iv];
    STAssertNotNil(decrypted, nil);
    STAssertEqualObjects(decrypted, content, nil);
}

@end
