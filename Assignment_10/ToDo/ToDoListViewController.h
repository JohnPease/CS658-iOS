//
//  ToDoViewController.h
//  ToDo
//
//  Created by John Pease on 3/7/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DeleteOnCompleteKey @"DeleteOnCompleteKey"

@interface ToDoListViewController : UITableViewController

@property(nonatomic, strong) NSMutableString* deleteOnComplete;

-(IBAction)addToDoListItem;
- (BOOL)saveChanges;

@end
