//
//  Queue.m
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/6/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Queue.h"

@implementation Queue

-(instancetype)init {
  self = [super init];
  if (self) {
    self.items = [[NSMutableArray alloc] init];
    
  }
  return self;
}

-(id) dequeue {
  if ([self.items count] == 0) {
    return nil;
  }
  else {
    id head = [self.items objectAtIndex:0];
    if (head != nil) {
      [self.items removeObjectAtIndex:0];
    }
    return head;
  }
}

-(void) enqueue:(id)obj {
  [self.items addObject:obj];
}

@end

