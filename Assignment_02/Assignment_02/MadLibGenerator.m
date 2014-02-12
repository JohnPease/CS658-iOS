
//
//  MadLibGenerator.m
//  Assignment_02
//
//  Created by John Jeffrey Pease on 2/4/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "MadLibGenerator.h"
#import "BlankFiller.h"

@implementation MadLibGenerator

-(id)init {
    self = [super init];
    if (self) {
        [self readMadLibTemplates];
    }
    return self;
}

-(void)readMadLibTemplates {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"madLibTemplateList" ofType:@"txt"];
	NSError* error;
	NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
	
	if (error) {
		NSLog(@"%@", [error localizedFailureReason]);
		return;
	}
	
	NSArray* fileLines = [fileContents componentsSeparatedByString:@"\n"];
	NSString* tempString = @"";
	
	for (int i = 0; i < [fileLines count]; ++i) {
		NSString* fileLine = [fileLines objectAtIndex:i];
		if ([fileLine isEqualToString:@""] || i == [fileLines count]-1) {
			WordTemplate* wordTemplate = [[WordTemplate alloc] initWithTemplate:tempString];
			[[super templates] addObject:wordTemplate];
			tempString = @"";
		} else {
			tempString = [tempString stringByAppendingFormat:@"%@\n", fileLine];
		}
	}
}

-(NSString*)description {
	return [WordTemplate description];
}

@end
