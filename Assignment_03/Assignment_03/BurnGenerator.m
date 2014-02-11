//
//  BurnGenerator.m
//  Assignment_02
//
//  Created by John Jeffrey Pease on 2/4/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "BurnGenerator.h"
#import "BlankFiller.h"

@implementation BurnGenerator

-(id)init {
    self = [super init];
    if (self) {
//        _burnTemplates = [[NSMutableArray alloc] init];
        [self readBurnTemplates];
    }
    return self;
}

-(void)readBurnTemplates {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"burnTemplateList" ofType:@"txt"];
    NSError* error;
    NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
		NSLog(@"%@", [error localizedFailureReason]);
		return;
	}
	
	NSArray* fileLines = [fileContents componentsSeparatedByString:@"\n"];
    
	for (NSString* fileLine in fileLines) {
        WordTemplate* wordTemplate = [[WordTemplate alloc] initWithTemplate:fileLine];
        [[super templates] addObject:wordTemplate];
	}
}

-(NSString*)description {
    return [WordTemplate description];
}

@end
