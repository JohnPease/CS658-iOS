//
//  PositionPlayer.h
//  Brewers
//
//  Created by John Pease on 5/2/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BrewersPlayer.h"

@interface PositionPlayer : BrewersPlayer

@property (nonatomic, retain) NSNumber * atBats;
@property (nonatomic, retain) NSDecimalNumber * average;
@property (nonatomic, retain) NSNumber * homeRuns;
@property (nonatomic, retain) NSNumber * rbi;
@property (nonatomic, retain) NSNumber * runs;
@property (nonatomic, retain) NSNumber * stolenBases;

@end
