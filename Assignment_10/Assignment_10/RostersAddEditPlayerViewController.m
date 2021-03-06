//
//  RostersEditPlayerViewController.m
//  Assignment_10
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "RostersAddEditPlayerViewController.h"
#import "BaseballPlayer.h"

@interface RostersAddEditPlayerViewController ()
@end

@implementation RostersAddEditPlayerViewController

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
	self.positionLabel.text = self.player.position;
	self.urlTextField.text = self.player.url;
	if (![self.player.headshotUrl isEqualToString:@"http://sports.cbsimg.net/images/players/unknown_hat.gif"]) {
		self.urlHeadshot.text = self.player.headshotUrl;
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return NO;
}

- (IBAction)cancel {
    [_delegate cancelAddPlayer];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)done {
    self.player.firstName = self.firstNameTextField.text;
    self.player.lastName = self.lastNameTextField.text;
    self.player.position = self.positionLabel.text;
    self.player.url = self.urlTextField.text;
	if (![self.urlHeadshot.text isEqualToString:@""]) {
		self.player.headshotUrl = self.urlHeadshot.text;
	}
	[_delegate doneAddPlayer];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)screenTapped {
	[self.view endEditing:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	CGFloat keyboardHeight = 216;
				
	if (textField.center.y > self.view.bounds.size.height - keyboardHeight) {
		[UIView beginAnimations:Nil context:Nil];
		[UIView setAnimationDuration:0.3];
		self.view.frame = CGRectOffset(self.view.frame, 0, (textField.center.y - self.view.bounds.size.height));
		[UIView commitAnimations];
	}
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	CGFloat keyboardHeight = 216;
	
	if (textField.center.y > self.view.bounds.size.height - keyboardHeight) {
		[UIView beginAnimations:Nil context:Nil];
		[UIView setAnimationDuration:0.3];
		self.view.frame = CGRectOffset(self.view.frame, 0, (textField.center.y - self.view.bounds.size.height)*-1);
		[UIView commitAnimations];
	}
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
