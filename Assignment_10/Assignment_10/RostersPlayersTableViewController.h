//
//  RostersPlayersTableViewController.h
//  Assignment_10
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RostersAddEditPlayerViewController.h"

@interface RostersPlayersTableViewController : UITableViewController <RostersAddPlayerDelegate>

@property(nonatomic, weak) NSMutableArray* players;

- (BOOL)saveChanges;

@end
