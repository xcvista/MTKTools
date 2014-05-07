//
//  MTKBitwiseOperationTest.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKBitwiseOperationBigTest : SenTestCase

@property NSMutableData *data55;
@property NSMutableData *dataAA;
@property NSMutableData *data00;
@property NSMutableData *dataFF;

@end

static inline NSMutableData *MTKDataCreateFilled(NSUInteger length, int fill)
{
    NSMutableData *data = [NSMutableData dataWithLength:length];
    memset([data mutableBytes], fill, length);
    return data;
}

@implementation MTKBitwiseOperationBigTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSUInteger length = 1 << 26; // 64MB of data
    
    self.data55 = MTKDataCreateFilled(length, 0x55);
    self.dataAA = MTKDataCreateFilled(length, 0xaa);
    self.data00 = MTKDataCreateFilled(length, 0x00);
    self.dataFF = MTKDataCreateFilled(length, 0xff);
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAnd
{
    STAssertEqualObjects([self.data55 bitwiseAndWithData:self.dataAA], self.data00, nil);
}

- (void)testOr
{
    STAssertEqualObjects([self.data55 bitwiseOrWithData:self.dataAA], self.dataFF, nil);
}

- (void)testNot
{
    STAssertEqualObjects([self.data55 bitwiseNot], self.dataAA, nil);
}

- (void)testXor
{
    STAssertEqualObjects([self.data55 bitwiseXorWithData:self.dataAA], self.dataFF, nil);
}

@end
