//
//  Pitcher.h
//  Brewers
//
//  Created by John Pease on 5/2/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BrewersPlayer.h"

@interface Pitcher : BrewersPlayer

@property (nonatomic, retain) NSNumber * era;
@property (nonatomic, retain) NSNumber * losses;
@property (nonatomic, retain) NSNumber * saves;
@property (nonatomic, retain) NSNumber * strikeouts;
@property (nonatomic, retain) NSNumber * walks;
@property (nonatomic, retain) NSDecimalNumber * whip;
@property (nonatomic, retain) NSNumber * wins;

@end
