//
//  AddReminderDetailViewController.m
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/4/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AddReminderDetailViewController.h"

@interface AddReminderDetailViewController ()

@end

@implementation AddReminderDetailViewController

- (IBAction)buttonPressed:(id)sender {
  
  if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:self.annotation.coordinate radius:2000 identifier:@"reminder"];
    [self.locationManager startMonitoringForRegion:region];
    
    //post a notification when called
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReminderAdded" object:self userInfo:@{@"reminder" : region}];
  }

  
}
-(void)viewDidLoad {
  [super viewDidLoad];
  NSLog(@"long : %f lat: %f", self.annotation.coordinate.longitude, self.annotation.coordinate.latitude);

}



@end