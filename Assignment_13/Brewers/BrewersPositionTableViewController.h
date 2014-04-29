//
//  BrewersPositionTableViewController.h
//  Brewers
//
//  Created by John Pease on 3/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrewersSettingsTableViewController.h"

@interface BrewersPositionTableViewController : UITableViewController<BrewersSettingsDelegate>

-(void)retrieveAllPlayerData;

@end
