//
//  BrewersPlayersTableViewController.h
//  Brewers
//
//  Created by John Pease on 3/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrewersPlayer.h"

@interface BrewersPlayersTableViewController : UITableViewController

@property(nonatomic, strong) NSMutableArray* players;
@property(nonatomic) Position position;

@end
