//
//  ToDoListItemDetailViewController.h
//  ToDo
//
//  Created by John Pease on 3/7/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToDoListItem;

@interface ToDoListItemDetailViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>

@property(nonatomic, weak) IBOutlet UITextField* titleTextField;
@property(nonatomic, weak) IBOutlet UITextView* textTextView;
@property(nonatomic, weak) IBOutlet UISwitch* completedSwitch;
@property(nonatomic, weak) IBOutlet UILabel* dueDateLabel;
@property(nonatomic, weak) IBOutlet UIDatePicker* datePicker;
@property(nonatomic, weak) ToDoListItem* item;

-(IBAction)screenTapped;
-(IBAction)chooseDueDate;

@end
