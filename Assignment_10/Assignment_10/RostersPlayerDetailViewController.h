//
//  RostersPlayerDetailViewController.h
//  Assignment_10
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseballPlayer;

@interface RostersPlayerDetailViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel* firstNameLabel;
@property(nonatomic, weak) IBOutlet UILabel* lastNameLabel;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) IBOutlet UIButton* moreInfoButton;
@property(nonatomic, weak) IBOutlet UIWebView* headshot;
@property(nonatomic, weak) BaseballPlayer* player;

@end
