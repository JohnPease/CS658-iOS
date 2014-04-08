//
//  ToDoListItemTableCell.h
//  ToDo
//
//  Created by John Pease on 3/7/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToDoListItem;

@interface ToDoListItemTableViewCell : UITableViewCell<UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UITextField* titleTextField;
@property(nonatomic, weak) ToDoListItem* item;

@end
