//
//  ToDoListItemDetailViewController.h
//  Assignment_08
//
//  Created by John Pease on 3/24/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToDoListItem;

@interface ToDoListItemDetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property(nonatomic, weak)IBOutlet UITextField* titleTextField;
@property(nonatomic, weak)IBOutlet UITextView* textTextView;
@property(nonatomic, weak)IBOutlet UISwitch* completedSwitch;
@property(nonatomic, weak)ToDoListItem* item;

- (IBAction)screenTapped;

@end
