//
//  ToDoListItemDetailViewController.m
//  Assignment_08
//
//  Created by John Pease on 3/24/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "ToDoListItemDetailViewController.h"
#import "ToDoListItem.h"

@interface ToDoListItemDetailViewController ()

@end

@implementation ToDoListItemDetailViewController

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
	self.titleTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = self.item.title;
    self.titleTextField.text = self.item.title;
    
    if (self.item.text != nil) {
        self.textTextView.text = self.item.text;
        self.textTextView.textColor = [UIColor blackColor];
    }
	
	if (self.item.dueDate != nil) {
		[self.dueDateLabel setText:[self formatDate:self.item.dueDate]];
		self.dueDateLabel.textColor = [UIColor blackColor];
	}
    
    if (self.item.isCompleted) {
        self.completedSwitch.on = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    self.item.title = [NSMutableString stringWithString:self.titleTextField.text];
    if (![self.textTextView.text isEqualToString:@"Notes"]) {
        self.item.text = [NSMutableString stringWithString:self.textTextView.text];
    }
	if (![self.dueDateLabel.text isEqualToString:@"None"]) {
		self.item.dueDate = self.dueDateDatePicker.date;
	}
    self.item.isCompleted = self.completedSwitch.isOn;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"Notes"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}

- (IBAction)screenTapped {
    [self.view endEditing:YES];
}

- (IBAction)dueDateLabelTapped {
	[self.dueDateDatePicker setHidden:NO];
}

- (IBAction)dueDateDatePicked {
	[self.dueDateLabel setText:[self formatDate:self.dueDateDatePicker.date]];
	[self.dueDateLabel setTextColor:[UIColor blackColor]];
	[self.dueDateDatePicker setHidden:YES];
}

- (NSString*)formatDate:(NSDate*)date {
	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"MMMM d 'at' h:mm a"];
	return [formatter stringFromDate:date];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
