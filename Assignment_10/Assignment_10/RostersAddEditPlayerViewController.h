//
//  RostersEditPlayerViewController.h
//  Assignment_10
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseballPlayer;

@protocol RostersAddPlayerDelegate <NSObject>

@required
- (void)doneAddPlayer;
- (void)cancelAddPlayer;

@end

@interface RostersAddEditPlayerViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic, weak) id <RostersAddPlayerDelegate> delegate;
@property(nonatomic, weak) IBOutlet UITextField* firstNameTextField;
@property(nonatomic, weak) IBOutlet UITextField* lastNameTextField;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) IBOutlet UITextField* urlTextField;
@property(nonatomic, weak) BaseballPlayer* player;

- (IBAction)cancel;
- (IBAction)done;
- (IBAction)screenTapped;

@end
