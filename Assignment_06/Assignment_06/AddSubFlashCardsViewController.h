//
//  FirstViewController.h
//  Assignment_06
//
//  Created by John Pease on 3/3/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSubFlashCardsViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel* operand1Label;
@property(nonatomic, weak) IBOutlet UILabel* operand2Label;
@property(nonatomic, weak) IBOutlet UILabel* operatorLabel;
@property(nonatomic, weak) IBOutlet UILabel* answerLabel;

- (IBAction)screenTapped;

@end
