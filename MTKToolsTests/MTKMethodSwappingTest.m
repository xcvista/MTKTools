//
//  MTKMethodSwappingTest.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/8/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKMethodSwappingTest : SenTestCase

@end

@interface MTKMethodSwappingTest (MethodToAdd)

- (id)three;

@end

id _MTKMethodSwappingTest_Three(id self, SEL _cmd)
{
    return @3;
}

@implementation MTKMethodSwappingTest

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swapMethod:@selector(one) withMethod:@selector(two)];
        [self addMethod:(IMP)_MTKMethodSwappingTest_Three withSelector:@selector(three) encoding:"@@:"];
    });
}

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

- (id)one
{
    return @2;
}

- (id)two
{
    return @1;
}

- (void)testExample
{
    STAssertEqualObjects([self one], @1, nil);
    STAssertEqualObjects([self two], @2, nil);
    STAssertEqualObjects([self three], @3, nil);
}

@end
