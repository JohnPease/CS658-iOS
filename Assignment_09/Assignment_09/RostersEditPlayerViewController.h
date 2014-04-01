//
//  RostersEditPlayerViewController.h
//  Assignment_09
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseballPlayer;

@interface RostersEditPlayerViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UITextField* firstNameTextField;
@property(nonatomic, weak) IBOutlet UITextField* lastNameTextField;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) IBOutlet UITextField* urlTextField;
@property(nonatomic, weak) BaseballPlayer* player;

- (IBAction)cancel;
- (IBAction)done;

@end
