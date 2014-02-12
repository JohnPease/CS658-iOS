//
//  BlankFiller.m
//  Assignment_02
//
//  Created by John Pease on 2/3/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "BlankFiller.h"
#import "Word.h"
#import "WordTemplate.h"

@implementation BlankFiller

-(id)init {
	self = [super init];
	if (self) {
		_nouns          = [[NSMutableArray alloc] init];
		_verbs          = [[NSMutableArray alloc] init];
		_adjectives     = [[NSMutableArray alloc] init];
		_adverbs        = [[NSMutableArray alloc] init];
		_interjections  = [[NSMutableArray alloc] init];
		_templates      = [[NSMutableArray alloc] init];
		[self readWords];
	}
	return self;
}

-(void)readWords {
	NSString* filePath = [[NSBundle mainBundle] pathForResource:@"wordList" ofType:@"txt"];
	NSError* error;
	NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
	
	if (error) {
		NSLog(@"%@", [error localizedFailureReason]);
		return;
	}
	
	NSArray* fileLines = [fileContents componentsSeparatedByString:@"\n"];
	NSArray* line;
	Word* wordEntry;
	for (NSString* fileLine in fileLines) {
		line = [fileLine componentsSeparatedByString:@":"];
		if ([line count] == 2) {
			wordEntry = [[Word alloc] initWithWord:[line objectAtIndex:0] partOfSpeech:[Word convertStringToPartOfSpeech:[line objectAtIndex:1]]];
			[self addWord:wordEntry];
		}
	}
}

-(void)addWord:(Word *)word {
	if ([word partOfSpeech] == NOUN) {
		[_nouns addObject:word];
	} else if ([word partOfSpeech] == VERB) {
		[_verbs addObject:word];
	} else if ([word partOfSpeech] == ADJECTIVE) {
		[_adjectives addObject:word];
	} else if ([word partOfSpeech] == ADVERB) {
		[_adverbs addObject:word];
	} else if ([word partOfSpeech] == INTERJECTION) {
		[_interjections addObject:word];
	}
}

-(Word*)getWordWithPartOfSpeech:(PartOfSpeech)partOfSpeech {
	if (partOfSpeech == NOUN) {
		return [_nouns objectAtIndex:arc4random_uniform((int)[_nouns count])];
	} else if (partOfSpeech ==  VERB) {
		return [_verbs objectAtIndex:arc4random_uniform((int)[_verbs count])];
	} else if (partOfSpeech == ADJECTIVE) {
		return [_adjectives objectAtIndex:arc4random_uniform((int)[_adjectives count])];
	} else if (partOfSpeech == ADVERB) {
		return [_adverbs objectAtIndex:arc4random_uniform((int)[_adverbs count])];
	} else if (partOfSpeech == INTERJECTION) {
		return [_interjections objectAtIndex:arc4random_uniform((int)[_interjections count])];
	} else {
		return nil;
	}
}

-(NSString*)generate {
    if ([_templates count] == 0) {
        return @"No templates found.";
    }
    
    WordTemplate* template = [_templates objectAtIndex:arc4random_uniform((int)[_templates count])];
    
    do {
        PartOfSpeech partOfSpeech = [template getNextBlankType];
        if (partOfSpeech == UNKNOWN) break;
        
        Word* word = [self getWordWithPartOfSpeech:partOfSpeech];
        [template replaceNextBlankWithWord:word];
    } while (TRUE);
    
    return [template filledTemplate];
    
}

@end
