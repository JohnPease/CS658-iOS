//
//  Word.m
//  Assignment_02
//
//  Created by John Pease on 2/3/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "Word.h"

@implementation Word

-(id)init {
	return [self initWithWord:@"" partOfSpeech:UNKNOWN];

}

-(id)initWithWord:(NSString *)word
	 partOfSpeech:(PartOfSpeech)partOfSpeech {
	
	self = [super init];
	if (self) {
		_word = word;
		_partOfSpeech = partOfSpeech;
	}
	return self;
}

-(id)initWithWord:(NSString *)word {
	return [self initWithWord:word partOfSpeech:UNKNOWN];
}

+(PartOfSpeech)convertStringToPartOfSpeech:(NSString*)string {
	if ([string isEqualToString:@"noun"]) {
		return NOUN;
	} else if ([string isEqualToString:@"verb"]) {
		return VERB;
	} else if ([string isEqualToString:@"adjective"]) {
		return ADJECTIVE;
	} else if ([string isEqualToString:@"adverb"]) {
		return ADVERB;
	} else if ([string isEqualToString:@"interjection"]) {
		return INTERJECTION;
	} else {
		return NOUN;
	}
}

-(NSString*)description {
	return _word;
}

@end
