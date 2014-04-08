//
//  ToDoListItem.m
//  ToDo
//
//  Created by John Pease on 3/7/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "ToDoListItem.h"

@implementation ToDoListItem

-(id)init
{
    self = [super init];
    if(self) {
        _title = [NSMutableString stringWithString:@"New ToDo Item"];
        _isCompleted = NO;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.title forKey:@"title"];
	[aCoder encodeObject:self.text forKey:@"text"];
	[aCoder encodeBool:self.isCompleted forKey:@"isCompleted"];
	[aCoder encodeObject:self.dueDate forKey:@"dueDate"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self) {
		_title = [aDecoder decodeObjectForKey:@"title"];
		_text = [aDecoder decodeObjectForKey:@"text"];
		_isCompleted = [aDecoder decodeBoolForKey:@"isCompleted"];
		_dueDate = [aDecoder decodeObjectForKey:@"dueDate"];
	}
	return self;
}

@end
