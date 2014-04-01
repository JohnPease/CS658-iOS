//
//  RostersAddPlayerDelegate.h
//  Assignment_09
//
//  Created by John Jeffrey Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RostersAddPlayerDelegate <NSObject>

@required
- (void)doneAddPlayer;
- (void)cancelAddPlayer;

@end