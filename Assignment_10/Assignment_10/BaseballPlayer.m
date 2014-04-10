//
//  BaseballPlayer.m
//  Assignment_10
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "BaseballPlayer.h"

@implementation BaseballPlayer

- (id)init {
	return [self initWithFirstName:@"" lastName:@"" position:@""];
}
- (id)initWithFirstName: (NSString*)firstName lastName:(NSString*)lastName position:(NSString*)position {
	self = [super init];
	if (self) {
		_firstName		= firstName;
		_lastName		= lastName;
		_position		= position;
		_headshotUrl	= @"http://sports.cbsimg.net/images/players/unknown_hat.gif";
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:_firstName		forKey:@"firstName"];
	[aCoder encodeObject:_lastName		forKey:@"lastName"];
	[aCoder encodeObject:_position		forKey:@"position"];
	[aCoder encodeObject:_url			forKey:@"url"];
	[aCoder encodeObject:_headshotUrl	forKey:@"headshotUrl"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self) {
		_firstName		= [aDecoder decodeObjectForKey:@"firstName"];
		_lastName		= [aDecoder decodeObjectForKey:@"lastName"];
		_position		= [aDecoder decodeObjectForKey:@"position"];
		_url			= [aDecoder decodeObjectForKey:@"url"];
		_headshotUrl	= [aDecoder decodeObjectForKey:@"headshotUrl"];
	}
	return self;
}

- (NSString*)fullName {
	return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}



@end
