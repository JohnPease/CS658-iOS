//
//  BrewersSettingsTableViewController.m
//  Assignment_12
//
//  Created by John Jeffrey Pease on 4/22/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "BrewersSettingsTableViewController.h"

@interface BrewersSettingsTableViewController ()

@end

@implementation BrewersSettingsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if (self.offlineModeSwitch.isOn) {
        [self.refreshPlayerButton setEnabled:NO];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.offlineModeSwitch.isOn) {
        self.offlineMode = [NSMutableString stringWithString:@"YES"];
    } else if (!self.offlineModeSwitch.isOn) {
        self.offlineMode = [NSMutableString stringWithString:@"NO"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshPlayersButtonPressed {
    /* refresh players using web service in helper thread */
}

- (IBAction)offlineModeSwitched {
    [self.refreshPlayerButton setEnabled:!self.offlineModeSwitch.isOn];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

@end
