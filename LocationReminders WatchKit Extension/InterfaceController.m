//
//  InterfaceController.m
//  LocationReminders WatchKit Extension
//
//  Created by Vania Kurniawati on 2/5/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import "InterfaceController.h"
#import "ReminderRowController.h"
#import <CoreLocation/CoreLocation.h>


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
  [super awakeWithContext:context];
  

  CLLocationManager *locationManager = [CLLocationManager new];
  NSSet *regions = locationManager.monitoredRegions;
  NSArray *regionsArray = regions.allObjects;

  
  NSArray *names = @[@"Brad",@"Russell",@"Richard",@"Pete",@"Kam"];
  [self.table setNumberOfRows:names.count withRowType:@"ReminderRowController"];
 
  NSInteger index = 0;
  for (NSString *name in names) {
    ReminderRowController *rowController = [self.table rowControllerAtIndex:index];
    [rowController.reminderLabel setText:name];
    index++;
  }
  
  // Configure interface objects here.
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



