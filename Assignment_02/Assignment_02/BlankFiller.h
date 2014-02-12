//
//  BlankFiller.h
//  Assignment_02
//
//  Created by John Pease on 2/3/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"
#import "WordTemplate.h"

@class Word;

@interface BlankFiller : NSObject

@property(nonatomic, strong) NSMutableArray* nouns;
@property(nonatomic, strong) NSMutableArray* verbs;
@property(nonatomic, strong) NSMutableArray* adjectives;
@property(nonatomic, strong) NSMutableArray* adverbs;
@property(nonatomic, strong) NSMutableArray* interjections;
@property(nonatomic, strong) NSMutableArray* templates;

-(id)init;
-(void)readWords;
-(void)addWord:(Word*)word;
-(Word*)getWordWithPartOfSpeech:(PartOfSpeech)partOfSpeech;
-(NSString*)generate;

@end
