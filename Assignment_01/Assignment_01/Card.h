//
//  Card.h
//  Assignment_01
//
//  Created by John Pease on 1/27/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {Clubs, Diamonds, Hearts, Spades} Suit;

@interface Card : NSObject

@property(nonatomic) int value;
@property(nonatomic) Suit suit;

@end
