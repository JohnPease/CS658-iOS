//
//  ViewController.h
//  Assignment_03
//
//  Created by John Jeffrey Pease on 2/11/14.
//  Copyright (c) 2014 John Jeffrey Pease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, weak) IBOutlet UITextView *textView;
@property(nonatomic, weak) IBOutlet UIButton *burnButton;
@property(nonatomic, weak) IBOutlet UIButton *madLibButton;

- (IBAction)burnButtonPressed:(id)sender;
- (IBAction)madLibButtonPresed:(id)sender;

@end
