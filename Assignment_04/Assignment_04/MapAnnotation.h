//
//  MapAnnotation.h
//  Assignment_04
//
//  Created by John Jeffrey Pease on 2/18/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString* title;
@property(nonatomic, copy) NSString* subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                    street:(NSString*)street
                    city:(NSString*)city;

-(id)init;
@end
