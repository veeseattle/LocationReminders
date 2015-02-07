//
//  ReminderRowController.h
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/5/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface ReminderRowController : NSObject
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *reminderLabel;

@property (strong, nonatomic) CLCircularRegion *rowRegion;

@end
