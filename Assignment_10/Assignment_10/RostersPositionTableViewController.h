//
//  RostersPositionTableViewController.h
//  Assignment_10
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RostersPositionTableViewController : UITableViewController

@property(nonatomic, strong) NSArray* allPositions;

- (BOOL)saveChanges;

@end
