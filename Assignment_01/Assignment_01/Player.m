//
//  Player.m
//  Assignment_01
//
//  Created by John Pease on 1/27/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id)init {
	self = [super init];
	if (self) {
		_hand = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void)addCard:(Card*)card {
	[_hand addObject:card];
}

-(Card*)getNextCard {
	Card* card = [_hand objectAtIndex:0];
	[_hand removeObjectAtIndex:0];
	return card;
}

-(BOOL)hasCards {
	return [_hand count] > 0;
}

-(int)numCards {
	return (int)[_hand count];
}

-(NSString*) description {
	return _name;
}

@end
