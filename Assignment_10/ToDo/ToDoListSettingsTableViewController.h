//
//  ToDoListSettingsTableViewController.h
//  Assignment_10
//
//  Created by John Pease on 4/7/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListSettingsTableViewController : UITableViewController

@property(nonatomic, weak) IBOutlet UISwitch* deleteOnCompleteSwitch;
@property(nonatomic, weak) NSMutableString* deleteOnComplete;

@end
