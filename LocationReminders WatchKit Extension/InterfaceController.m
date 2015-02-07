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
  //MKPointAnnotation *annotation = [MKPointAnnotation new];
  
  
 [self.table setNumberOfRows:regionsArray.count withRowType:@"ReminderRowController"];
 
  NSInteger index = 0;
  for (CLCircularRegion *region in regionsArray) {
    ReminderRowController *rowController = [self.table rowControllerAtIndex:index];
    [rowController.reminderLabel setText:region.identifier];
    CLLocationCoordinate2D center = region.center;
    rowController.rowRegion = [[CLCircularRegion alloc] initWithCenter:center radius:50 identifier:@"CELL_REGION"];
    index++;
  }
  
  
  // Configure interface objects here.
}



- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
  ReminderRowController *rowController = [self.table rowControllerAtIndex:rowIndex];
  return rowController.rowRegion;
  
}
//- contextForSegueWithIdentifier --> return region

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  NSLog(@"asdf");
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



