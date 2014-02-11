//
//  ViewController.m
//  Assignment_03
//
//  Created by John Jeffrey Pease on 2/11/14.
//  Copyright (c) 2014 John Jeffrey Pease. All rights reserved.
//

#import "ViewController.h"
#import "BurnGenerator.h"
#import "MadLibGenerator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)burnButtonPressed:(id)sender {
    BurnGenerator* burnGenerator = [[BurnGenerator alloc] init];
    [burnGenerator setTemplates:[burnGenerator templates]];
    NSString *burns = [burnGenerator generate];
    [_textView setText:burns];
    for (WordTemplate *temp in [burnGenerator templates]) [temp clearFilledTemplate];
}

- (IBAction)madLibButtonPresed:(id)sender {
    MadLibGenerator* madLibGenerator = [[MadLibGenerator alloc] init];
    [madLibGenerator setTemplates:[madLibGenerator templates]];
    NSString *madLibs = [madLibGenerator generate];
    [_textView setText:madLibs];
    for (WordTemplate *temp in [madLibGenerator templates]) [temp clearFilledTemplate];
}

@end
