//
//  Player.h
//  Assignment_01
//
//  Created by John Pease on 1/27/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Player : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong, readonly) NSMutableArray* hand;

-(void)addCard:(Card*)card;
-(Card*)getNextCard;
-(BOOL)hasCards;
-(int)numCards;

@end
