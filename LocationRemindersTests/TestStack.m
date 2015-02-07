//
//  LocationRemindersTests.m
//  LocationRemindersTests
//
//  Created by Vania Kurniawati on 2/2/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Stack.h"

@interface TestStack : XCTestCase

@end

@implementation TestStack

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testStackPush {
  Stack *testStack = [[Stack alloc] init];
  [testStack push:@"Pomeranian"];
  XCTAssertEqual(testStack.items.count, 1);
  }

- (void)testStackPop {
  Stack *testStack = [[Stack alloc] init];
  id popVar = [testStack pop];
  XCTAssertNil(popVar);
}

- (void)testStackPeek {
  Stack *testStack = [[Stack alloc] init];
  [testStack push:@"Pomeranian"];
  [testStack push:@"Chow chow"];
  [testStack push:@"Keeshond"];
  id peekVar = [testStack peek];
  XCTAssertEqual(peekVar, @"Keeshond");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
