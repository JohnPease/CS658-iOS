//
//  BrewersPlayerDetailViewController.h
//  Brewers
//
//  Created by John Pease on 3/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BrewersPlayer;

@interface BrewersPlayerDetailViewController : UIViewController

@property(nonatomic, weak) BrewersPlayer* player;
@property(nonatomic, weak) IBOutlet UILabel* firstNameLabel;
@property(nonatomic, weak) IBOutlet UILabel* lastNameLabel;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) IBOutlet UIButton* moreInfoButton;
@property(nonatomic, weak) IBOutlet UIImageView* headshotImageView;
@property(nonatomic, weak) IBOutlet UILabel* statsIndicatorLabel;
@property(nonatomic, weak) IBOutlet UILabel* statsValueLabel;

@end
