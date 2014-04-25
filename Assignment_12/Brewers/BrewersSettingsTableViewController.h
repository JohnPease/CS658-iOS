//
//  BrewersSettingsTableViewController.h
//  Assignment_12
//
//  Created by John Jeffrey Pease on 4/22/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FirstTimeKey @"FirstTimeKey"

@protocol BrewersRefreshPlayerDelegate <NSObject>

@required
- (void)refreshPlayers;

@end

@interface BrewersSettingsTableViewController : UITableViewController

@property(nonatomic, weak) id <BrewersRefreshPlayerDelegate> delegate;
@property(nonatomic, weak) IBOutlet UISwitch* offlineModeSwitch;
@property(nonatomic, weak) IBOutlet UIButton* refreshPlayerButton;
@property(nonatomic, weak) NSMutableString* offlineMode;

- (IBAction)refreshPlayersButtonPressed;
- (IBAction)offlineModeSwitched;

@end
