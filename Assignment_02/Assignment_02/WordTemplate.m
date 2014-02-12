//
//  WordTemplate.m
//  Assignment_02
//
//  Created by John Pease on 2/3/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "WordTemplate.h"

@implementation WordTemplate {
	NSRange _nextBlankRange;
}

-(id)init {
	return [self initWithTemplate:@""];
}

-(id)initWithTemplate:(NSString*)template {
	self = [super init];
	if (self) {
		_template = template;
		_filledTemplate = [NSMutableString stringWithString:_template];
	}
	return self;
}

-(PartOfSpeech)getNextBlankType {
	NSRange start = [_filledTemplate rangeOfString:@"<"];
	if (start.length != 0) {
		NSRange end = [_filledTemplate rangeOfString:@">"];
		_nextBlankRange = NSMakeRange(start.location, (end.location - start.location) + 1);
		NSRange blankTypeRange = NSMakeRange(_nextBlankRange.location + 1, _nextBlankRange.length - 2);
		NSString* blank = [_filledTemplate substringWithRange:blankTypeRange];
		return [Word convertStringToPartOfSpeech:blank];
	} else {
		return UNKNOWN;
	}
}

-(void)replaceNextBlankWithWord:(Word*)word {
	[_filledTemplate replaceCharactersInRange:_nextBlankRange withString:[word word]];
}

-(void)clearFilledTemplate {
	_filledTemplate = [NSMutableString stringWithString:_template];
}

-(NSString*)description {
    return _template;
}

@end
