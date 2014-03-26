//
//  ToDoListItem.m
//  Assignment_08
//
//  Created by John Pease on 3/24/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "ToDoListItem.h"

@implementation ToDoListItem

- (id)init {
    self = [super init];
    if (self) {
        _title       = [NSMutableString stringWithString:@"New ToDo Item"];
        _isCompleted = NO;
//		_dueDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    }
    return self;
}

@end
