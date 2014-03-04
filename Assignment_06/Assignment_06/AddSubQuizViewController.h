//
//  SecondViewController.h
//  Assignment_06
//
//  Created by John Pease on 3/3/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSubQuizViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic, strong) IBOutletCollection(UILabel) NSArray* questionLabels;
@property(nonatomic, strong) IBOutletCollection(UITextField) NSArray* answerTextFields;
@property(nonatomic, strong) IBOutletCollection(UIImageView) NSArray* correctnessImages;
@property(nonatomic, weak) IBOutlet UIButton* button;

- (IBAction)buttonPressed;
- (IBAction)screenTapped;
@end
