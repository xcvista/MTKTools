//
//  MTKAESCryptographyTest.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKAESCryptographyTest : SenTestCase

@end

@implementation MTKAESCryptographyTest

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

- (void)testAESCFB
{
    // Get contents, key and IV
    NSData *content = [NSData randomSecureDataWithLength:2048];
    NSData *key = [NSData randomSecureDataWithLength:32];
    NSData *iv = [NSData randomSecureDataWithLength:16];
    
    // Encrypt
    NSData *encrypted = [content dataByAESCFBEncryptWithKey:key initializationVector:iv];
    STAssertNotNil(encrypted, nil);
    STAssertEquals([content length], [encrypted length], nil);
    
    // Decrypt
    NSData *decrypted = [encrypted dataByAESCFBDecryptWithKey:key initializationVector:iv];
    STAssertNotNil(decrypted, nil);
    STAssertEqualObjects(decrypted, content, nil);
}

- (void)testAESOFB
{
    // Get contents, key and IV
    NSData *content = [NSData randomSecureDataWithLength:2048];
    NSData *key = [NSData randomSecureDataWithLength:32];
    NSData *iv = [NSData randomSecureDataWithLength:16];
    
    // Encrypt
    NSData *encrypted = [content dataByAESOFBScrambleWithKey:key initializationVector:iv];
    STAssertNotNil(encrypted, nil);
    STAssertEquals([content length], [encrypted length], nil);
    
    // Decrypt
    NSData *decrypted = [encrypted dataByAESOFBScrambleWithKey:key initializationVector:iv];
    STAssertNotNil(decrypted, nil);
    STAssertEqualObjects(decrypted, content, nil);
}

- (void)testAESCTR
{
    // Get contents, key and IV
    NSData *content = [NSData randomSecureDataWithLength:2048];
    NSData *key = [NSData randomSecureDataWithLength:32];
    NSData *iv = [NSData randomSecureDataWithLength:16];
    
    // Encrypt
    NSData *encrypted = [content dataByAESCTRScrambleWithKey:key initializationVector:iv];
    STAssertNotNil(encrypted, nil);
    STAssertEquals([content length], [encrypted length], nil);
    
    // Decrypt
    NSData *decrypted = [encrypted dataByAESCTRScrambleWithKey:key initializationVector:iv];
    STAssertNotNil(decrypted, nil);
    STAssertEqualObjects(decrypted, content, nil);
}

@end
