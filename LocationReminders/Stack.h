//
//  Stack.h
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/6/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

@property (strong,nonatomic) NSMutableArray *items;

-(void)push:(id)item;
-(id)pop:(id)item;
-(id)peek:(id)item;

@end

