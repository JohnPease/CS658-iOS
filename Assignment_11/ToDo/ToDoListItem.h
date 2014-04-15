//
//  ToDoListItem.h
//  Assignment_11
//
//  Created by John Pease on 4/15/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ToDoListItem : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSNumber * isCompleted;
@property (nonatomic, retain) NSDate * dueDate;

@end
