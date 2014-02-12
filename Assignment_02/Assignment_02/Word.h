//
//  Word.h
//  Assignment_02
//
//  Created by John Pease on 2/3/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {UNKNOWN, NOUN, VERB, ADJECTIVE, ADVERB, INTERJECTION} PartOfSpeech;

@interface Word : NSObject

@property(nonatomic, strong) NSString* word;
@property(nonatomic) PartOfSpeech partOfSpeech;

+(PartOfSpeech)convertStringToPartOfSpeech:(NSString*)string;

-(id)init;
-(id)initWithWord:(NSString*)word
	 partOfSpeech:(PartOfSpeech)partOfSpeech;
-(id)initWithWord:(NSString*)word;

@end
