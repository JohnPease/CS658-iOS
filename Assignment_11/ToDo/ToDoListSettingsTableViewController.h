//
//  ToDoListSettingsTableViewController.h
//  ToDo2
//
//  Created by Ryan Hardt on 3/30/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListSettingsTableViewController : UITableViewController

@property(nonatomic, weak) IBOutlet UISwitch* deleteOnCompleteSwitch;
@property(nonatomic, weak) NSMutableString* deleteOnComplete;

@end
