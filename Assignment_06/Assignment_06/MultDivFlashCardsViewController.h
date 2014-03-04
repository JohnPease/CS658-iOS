//
//  MultDivViewController.h
//  Assignment_06
//
//  Created by John Jeffrey Pease on 3/4/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultDivFlashCardsViewController : UIViewController

@property(nonatomic, weak)IBOutlet UILabel* topLabel;
@property(nonatomic, weak)IBOutlet UILabel* leftLabel;
@property(nonatomic, weak)IBOutlet UILabel* rightLabel;
@property(nonatomic, weak)IBOutlet UILabel* bottomLabel;

- (IBAction)screenTapped;

@end
