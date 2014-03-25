//
//  ToDoListItem.h
//  Assignment_08
//
//  Created by John Pease on 3/24/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoListItem : NSObject

@property(nonatomic, strong) NSMutableString* title;
@property(nonatomic, strong) NSMutableString* text;
@property(nonatomic) BOOL isCompleted;

- (id)init;

@end
