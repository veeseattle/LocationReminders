//
//  MapViewController.m
//  LocationReminders
//
//  Created by Vania Kurniawati on 2/2/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "AddReminderDetailViewController.h"

@interface MapViewController () <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

@property (strong,nonatomic) CLLocationManager *locationManager;

@property (strong,nonatomic) MKPointAnnotation *selectedAnnotation;


@end

@implementation MapViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  self.mapView.delegate = self;
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reminderAdded:) name:@"ReminderAdded" object:nil];
  
  if ([CLLocationManager locationServicesEnabled]) {
    
    NSLog(@"current status is %d", [CLLocationManager authorizationStatus]);
    
    if ([CLLocationManager authorizationStatus] == 0) {
      [self.locationManager requestAlwaysAuthorization];
      
    }
    
    else {
      self.mapView.showsUserLocation = true;
      [self.locationManager startMonitoringSignificantLocationChanges];
    }
  } else {
    
  }
  [self.locationManager startUpdatingLocation];
  
  UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(mapLongPressed:)];
  
  [self.mapView addGestureRecognizer:longPress];
  
  
  CLLocationCoordinate2D coord = {.latitude = 40.7411, .longitude = -73.9897};
  MKCoordinateSpan span = {.latitudeDelta = 0.2, .longitudeDelta = 0.2};
  MKCoordinateRegion region = {coord, span};
  [_mapView setRegion:(region) animated:(TRUE)];
  
}

- (IBAction)button1:(id)sender {
  CLLocationCoordinate2D coord = {.latitude = 47.6097, .longitude = -122.3331};
  MKCoordinateSpan span = {.latitudeDelta = 0.2, .longitudeDelta = 0.2};
  MKCoordinateRegion region = {coord, span};
  [_mapView setRegion:(region) animated:(TRUE)];
}

- (IBAction)button2:(id)sender {
  CLLocationCoordinate2D coord = {.latitude = 28.4186, .longitude = -81.5811};
  MKCoordinateSpan span = {.latitudeDelta = 0.2, .longitudeDelta = 0.2};
  MKCoordinateRegion region = {coord, span};
  [_mapView setRegion:(region) animated:(TRUE)];
}

- (IBAction)button3:(id)sender {
  CLLocationCoordinate2D coord = {.latitude = 52.5163, .longitude = 13.3777};
  MKCoordinateSpan span = {.latitudeDelta = 0.2, .longitudeDelta = 0.2};
  MKCoordinateRegion region = {coord, span};
  [_mapView setRegion:(region) animated:(TRUE)];
  
  
}

//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
//  CLLocation *location = locations.firstObject;
//  NSLog(@"latitude: %f and longitude: %f",location.coordinate.latitude, location.coordinate.longitude);
//}

//Long pressed
-(void)mapLongPressed:(id)sender {
  
  UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
  NSLog(@"long press fired");
  if (longPress.state == 3 ) {
    NSLog(@"long press ended");
    CGPoint location = [longPress locationInView:self.mapView];
    NSLog(@"location y: %f location x: %f",location.y, location.x);
    CLLocationCoordinate2D coordinates = [self.mapView convertPoint:location toCoordinateFromView:self.mapView];
    NSLog(@"coordinate long: %f coordinate lat x: %f",coordinates.longitude, coordinates.latitude);
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = coordinates;
    annotation.title = @"New Location";
    
    [self.mapView addAnnotation:annotation];
  }
  
  
}

//MARK: Add Reminder
-(void) reminderAdded:(NSNotification *)notification {
  NSLog(@"reminder notification added");
  NSDictionary *userInfo = notification.userInfo;
  CLCircularRegion *region = userInfo[@"reminder"];
  NSString *notificationName = notification.name;
  
  MKCircle *circleOverlay = [MKCircle circleWithCenterCoordinate:region.center radius:region.radius];
  
  [self.mapView addOverlay:circleOverlay];
}

//Circle overlay
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
  MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
  circleRenderer.fillColor = [UIColor blueColor];
  circleRenderer.strokeColor = [UIColor redColor];
  circleRenderer.alpha = 0.25;
  return circleRenderer;
}


//Annotation
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  
  if (annotation == self.mapView.userLocation) {
    return nil;
  }
  MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
  annotationView.animatesDrop = true;
  annotationView.pinColor = MKPinAnnotationColorPurple;
  annotationView.canShowCallout = true;
  annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
  
  return annotationView;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  CLLocation *location = locations.firstObject;
//  NSLog(@"updating location");
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
  NSLog(@"did enter region");
  UILocalNotification *localNotification = [[UILocalNotification alloc] init];
  localNotification.alertBody = @"region entered!";
  localNotification.alertAction = @"region action";
  
  [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
  NSLog(@"didExitRegion");
}



//MARK: Segue Setup
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  self.selectedAnnotation = view.annotation;
  [self performSegueWithIdentifier:@"SHOW_DETAIL" sender:self];
  
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"SHOW_DETAIL"]) {
    AddReminderDetailViewController *addReminderVC = (AddReminderDetailViewController *)segue.destinationViewController;
    addReminderVC.annotation = self.selectedAnnotation;
    addReminderVC.locationManager = self.locationManager;
  }
}

-(void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
