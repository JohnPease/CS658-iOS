//
//  ViewController.h
//  Assignment_04
//
//  Created by John Pease on 2/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property(nonatomic, weak) IBOutlet MKMapView* mapView;
@property(nonatomic, strong) CLLocationManager* locationManager;

@end
