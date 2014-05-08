//
//  MTKClassDetectionOverrideTest.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/8/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKClassDetectionOverrideTest : SenTestCase

@property NSArray *overridden;

@end

@implementation MTKClassDetectionOverrideTest

MTKClassForKey(overridden, NSString);

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

- (void)testOverride
{
    STAssertEquals([self classForKey:@"overridden"], [NSString class], nil);
}

@end
