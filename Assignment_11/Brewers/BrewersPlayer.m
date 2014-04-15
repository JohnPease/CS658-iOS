//
//  BrewersPlayer.m
//  brewers
//
//  Created by John Pease on 4/15/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "BrewersPlayer.h"


@implementation BrewersPlayer

@dynamic firstName;
@dynamic lastName;
@dynamic infoUrl;
@dynamic headshotUrl;
@dynamic position;

+(NSString*)nameForPosition:(Position)position {
	if (position == PITCHER) {
		return @"Pitcher";
	}
	
	switch (position) {
		case PITCHER:
			return @"Pitcher";
			break;
		case CATCHER:
			return @"Catcher";
			break;
		case FIRST_BASE:
			return @"First base";
			break;
		case SECOND_BASE:
			return @"Second base";
			break;
		case THIRD_BASE:
			return @"Third base";
			break;
		case SHORTSTOP:
			return @"Shortstop";
			break;
		case LEFT_FIELD:
			return @"Left field";
			break;
		case CENTER_FIELD:
			return @"Center field";
			break;
		case RIGHT_FIELD:
			return @"Right field";
			break;
		default:
			return @"None";
			break;
	}
}

-(NSString*)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
