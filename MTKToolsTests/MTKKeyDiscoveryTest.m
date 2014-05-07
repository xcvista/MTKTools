//
//  MTKKeyDiscoveryTest.m
//  MTKTools
//
//  Created by Maxthon Chan on 5/7/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <MTKTools/MTKTools.h>

@interface MTKKeyDiscoveryTest : SenTestCase

@property NSString *NSString;
@property NSArray *NSArray;
@property NSNumber *NSNumber;

@end

@implementation MTKKeyDiscoveryTest

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

- (void)testKeyDiscovery
{
    NSArray *keys = [self allKeys];
    STAssertEquals([keys count], (NSUInteger)3, nil);
    
    for (NSString *key in keys)
    {
        Class namedClass = NSClassFromString(key);
        Class discoveredClass = [self classForKey:key];
        STAssertEquals(namedClass, discoveredClass, nil);
    }
}

@end
