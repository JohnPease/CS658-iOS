//
//  Deck.h
//  Assignment_01
//
//  Created by John Pease on 1/27/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Deck : NSObject

@property(nonatomic, strong, readonly) NSMutableArray* cards;

-(Card*)dealCard;
-(BOOL)hasCards;

@end
