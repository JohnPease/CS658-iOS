//
//  ViewController.m
//  Assignment_04
//
//  Created by John Pease on 2/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)CLPlacemark* placemark;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Changes map type based on selectedSegmentIndex
- (IBAction)mapTypeControl:(id)sender {
    int selectedIndex = [sender selectedSegmentIndex];
    if (selectedIndex == 0) {
        [_mapView setMapType:MKMapTypeStandard];
    } else if (selectedIndex == 1) {
        [_mapView setMapType:MKMapTypeSatellite];
    } else if (selectedIndex == 2) {
        [_mapView setMapType:MKMapTypeHybrid];
    }
}

- (IBAction)markItButtonPressed:(id)sender {
}

- (void)reverseGeocodeLocation:(CLLocation*)location {
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray* placemarks, NSError* error) {
        self.placemark = [placemarks objectAtIndex:0];
    }];
}

//MKMapViewDelegate
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
}

//CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation* location = [locations lastObject];
    NSLog(@"Location: %@", location);
}

@end
