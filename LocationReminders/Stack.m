//
//  Stack.m
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/6/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Stack.h"

@implementation Stack

-(instancetype)init {
  self = [super init];
  if (self) {
    self.items = [[NSMutableArray alloc] init];
  }
  return self;
}


//push to stack
-(void)push:(id)item {
  [self.items addObject:item];
}


//pop off stack
-(id)pop:(id)item {
  if (self.items !=nil) {
    id tempItem = [self.items lastObject];
    [self.items removeLastObject];
    return tempItem;
  }
  else {
    NSLog(@"The stack is empty");
    return nil;
  }
}

//peek
-(id)peek:(id)item {
  return [self.items lastObject];
}


@end