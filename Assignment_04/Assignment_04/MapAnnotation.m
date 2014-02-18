//
//  MapAnnotation.m
//  Assignment_04
//
//  Created by John Jeffrey Pease on 2/18/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

-(id)init {
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.0758, -87.88628) street:@"Cramer" city:@"Milwaukee"];
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate street:(NSString *)street city:(NSString *)city {
    self = [super init];
    if (self) {
        _coordinate = coordinate;
        _title = street;
        _subtitle = city;
    }
    return self;
}

@end
