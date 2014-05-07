//
//  MTKKeyClassDetermination.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/8/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKKeyClassDetermination : SenTestCase

@property NSString *string;
@property int integer;
@property id unknown;
@property float fl;
@property NSRange structure;
@property NSError *err;

@end

@implementation MTKKeyClassDetermination

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

- (void)testClassDetermination
{
    NSDictionary *testCases = @{
                                @"string": @"NSString",
                                @"integer": @"NSNumber",
                                @"unknown": [NSNull null],
                                @"fl": @"NSNumber",
                                @"structure": @"NSValue",
                                @"err": @"NSError"
                                };
    
    for (NSString *key in testCases)
    {
        id value = testCases[key];
        Class class = [self classForKey:key];
        if (class)
            STAssertEqualObjects(value, NSStringFromClass(class), nil);
        else
            STAssertEqualObjects(value, [NSNull null], nil);
    }
}

@end
