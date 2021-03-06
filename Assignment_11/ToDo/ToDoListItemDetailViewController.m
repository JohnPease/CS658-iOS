//
//  ToDoListItemDetailViewController.m
//  ToDo
//
//  Created by Ryan Hardt on 3/7/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "ToDoListItemDetailViewController.h"
#import "ToDoListItem.h"

@interface ToDoListItemDetailViewController ()
@property(nonatomic, strong) NSDateFormatter* dateFormatter;
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
    [self addLineViews];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"MMMM d 'at' h:mm a"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addLineViews
{
    UIView* textTextViewLineTop =[[UIView alloc] init];
    float x = self.textTextView.frame.origin.x;
    float y = self.textTextView.frame.origin.y;
    float width = self.textTextView.frame.size.width;
    textTextViewLineTop.frame=CGRectMake(x, y, width, 1);
    textTextViewLineTop.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:textTextViewLineTop];
    
    UIView* textTextViewLineBottom =[[UIView alloc] init];
    y = self.textTextView.frame.origin.y + self.textTextView.frame.size.height;
    textTextViewLineBottom.frame=CGRectMake(x, y, width, 1);
    textTextViewLineBottom.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:textTextViewLineBottom];
    
    UIView* dueDateLineBottom =[[UIView alloc] init];
    y = self.datePicker.frame.origin.y;
    dueDateLineBottom.frame=CGRectMake(x, y, width, 1);
    dueDateLineBottom.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:dueDateLineBottom];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

-(IBAction)screenTapped
{
    [self.view endEditing:YES];
    [self hideDatePicker];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = self.item.title;
    self.titleTextField.text = self.item.title;
    
    if(self.item.text != nil) {
        self.textTextView.text = self.item.text;
        self.textTextView.textColor = [UIColor blackColor];
    }
    
    if(self.item.isCompleted == [NSNumber numberWithBool:YES]) {
        self.completedSwitch.on = YES;
    }
    
    if(self.item.dueDate != nil) {
        self.datePicker.date = self.item.dueDate;
        self.dueDateLabel.text = [self.dateFormatter stringFromDate:self.item.dueDate];
        self.dueDateLabel.textColor = [UIColor blackColor];
    }
    self.datePicker.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    if(self.titleTextField.text ) {
        self.item.title = [NSMutableString stringWithString:self.titleTextField.text];
    }
    if(![self.textTextView.text isEqualToString:@"Notes"]) {
        self.item.text = [NSMutableString stringWithString:self.textTextView.text];
    }
    if(self.completedSwitch.isOn) {
        self.item.isCompleted = [NSNumber numberWithBool:YES];
    } else {
        self.item.isCompleted = [NSNumber numberWithBool:NO];
    }
    
    if(![self.dueDateLabel.text isEqualToString:@"None"]) {
        self.item.dueDate = self.datePicker.date;
    }
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"Notes"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    
    [self hideDatePicker];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self hideDatePicker];
}

-(IBAction)chooseDueDate
{
    if(self.datePicker.hidden) {
        [self.view endEditing:YES];
        self.datePicker.hidden = NO;
    } else {
        [self hideDatePicker];
    }
}

-(void)hideDatePicker
{
    if(!self.datePicker.hidden) {
        self.datePicker.hidden = YES;
        self.dueDateLabel.textColor = [UIColor blackColor];
        self.dueDateLabel.text = [self.dateFormatter stringFromDate:self.datePicker.date];
    }
}
@end
