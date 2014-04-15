//
//  BrewersAddEditPlayerViewController.m
//  Brewers
//
//  Created by John Pease on 3/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "BrewersAddEditPlayerViewController.h"
#import "BrewersPlayer.h"
#define PORTRAIT_KEYBOARD_HEIGHT (216)
#define KEYBOARD_ADJUSTMENT (100)

@interface BrewersAddEditPlayerViewController ()

@end

@implementation BrewersAddEditPlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.firstNameTextField.text = self.player.firstName;
    self.lastNameTextField.text = self.player.lastName;
    self.positionLabel.text = [BrewersPlayer nameForPosition:[self.player.position intValue]];
    self.urlTextField.text = self.player.infoUrl;
    self.headshotUrlTextField.text = self.player.headshotUrl;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
   if((textField.center.y + textField.frame.size.height/2) > (self.view.bounds.size.height-PORTRAIT_KEYBOARD_HEIGHT)) {
        [self moveView:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if((textField.center.y + textField.frame.size.height/2) > (self.view.bounds.size.height-PORTRAIT_KEYBOARD_HEIGHT)) {
        [self moveView:NO];
    }
}

-(void)moveView:(BOOL)moveUp
{
    int movement = (moveUp ? -KEYBOARD_ADJUSTMENT : KEYBOARD_ADJUSTMENT);
    
    [UIView beginAnimations:nil context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: 0.3];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (IBAction)cancel:(id)sender
{
	if ([self.isAdd boolValue]) {
		[self.delegate cancelAddPlayer];
	}
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)done:(id)sender
{
    self.player.firstName = self.firstNameTextField.text;
    self.player.lastName = self.lastNameTextField.text;
    self.player.infoUrl = self.urlTextField.text;
    self.player.headshotUrl = self.headshotUrlTextField.text;
    
	if ([self.isAdd boolValue]) {
		[self.delegate doneAddPlayer];
	}
    [self.navigationController popViewControllerAnimated:YES];
}

@end
