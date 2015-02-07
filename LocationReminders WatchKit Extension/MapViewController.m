//
//  MapViewController.m
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/6/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
#import "MapViewController.h"


@interface MapViewController()

@end


@implementation MapViewController

- (void)awakeWithContext:(id)context {
  [super awakeWithContext:context];
  
  CLCircularRegion *test = (CLCircularRegion *)context;
  
  MKCoordinateSpan span = {.latitudeDelta = 0.07, .longitudeDelta = 0.07};
  MKCoordinateRegion region = {test.center, span};

  [self.watchMap setRegion:(region)];
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