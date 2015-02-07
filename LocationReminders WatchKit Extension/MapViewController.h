//
//  MapViewController.h
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/6/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface MapViewController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceMap *watchMap;

@end