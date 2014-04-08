//
//  BaseballPlayer.m
//  Assignment_09
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
		_firstName = firstName;
		_lastName = lastName;
		_position = position;
	}
	return self;
}
- (NSString*)fullName {
	return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
