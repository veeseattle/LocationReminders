//
//  AddReminderDetailViewController.h
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/4/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AddReminderDetailViewController : UIViewController

@property (strong,nonatomic) MKPointAnnotation *annotation;
@property (strong,nonatomic) CLLocationManager *locationManager;

@end

