//
//  WordTemplate.h
//  Assignment_02
//
//  Created by John Pease on 2/3/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface WordTemplate : NSObject

@property(nonatomic, strong) NSString* template;
@property(nonatomic, strong) NSMutableString* filledTemplate;

-(id)init;
-(id)initWithTemplate:(NSString*)template;
-(PartOfSpeech)getNextBlankType;
-(void)replaceNextBlankWithWord:(Word*)word;
-(void)clearFilledTemplate;

@end
