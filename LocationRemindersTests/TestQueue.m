//
//  TestQueue.m
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/7/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Queue.h"

@interface TestQueue : XCTestCase

@end

@implementation TestQueue

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

- (void)testEnqueue {
  Queue *testQueue = [[Queue alloc] init];
  [testQueue enqueue:@"Hanauma Bay"];
  XCTAssertEqual(testQueue.items.count, 1);
}

- (void)testDequeue {
  Queue *testQueue = [[Queue alloc] init];
  [testQueue enqueue:@"Magical Monkey Forest"];
  [testQueue enqueue:@"Rainbow Avenue"];
  id queueVar = [testQueue dequeue];
  XCTAssertEqual(queueVar, @"Magical Monkey Forest");
}

@end
