//
//  ToDoListItem.h
//  ToDo
//
//  Created by John Pease on 3/7/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoListItem : NSObject <NSCoding>

@property(nonatomic, strong) NSMutableString* title;
@property(nonatomic, strong) NSMutableString* text;
@property(nonatomic) BOOL isCompleted;
@property(nonatomic, strong) NSDate* dueDate;

-(id)init;
-(void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;

@end
