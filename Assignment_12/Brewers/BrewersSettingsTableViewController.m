//
//  BrewersSettingsTableViewController.m
//  Assignment_12
//
//  Created by John Jeffrey Pease on 4/22/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "BrewersSettingsTableViewController.h"
#import "BrewersPositionTableViewController.h"
#import "AppDelegate.h"

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
}

- (void)viewWillAppear:(BOOL)animated {
    self.offlineMode = [[NSUserDefaults standardUserDefaults] objectForKey:OfflineModeKey];
    if ([self.offlineMode isEqualToString:@"YES"]) {
        [self.offlineModeSwitch setOn:YES];
    } else {
        [self.offlineModeSwitch setOn:NO];
    }
	[self.refreshPlayerButton setEnabled:!self.offlineModeSwitch.isOn];
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.offlineModeSwitch.isOn) {
        self.offlineMode = [NSMutableString stringWithString:@"YES"];
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:OfflineModeKey];
    } else if (!self.offlineModeSwitch.isOn) {
        self.offlineMode = [NSMutableString stringWithString:@"NO"];
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:OfflineModeKey];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshPlayersButtonPressed {
    [self clearPlayerData];
	[self refreshPlayers];
}

- (IBAction)offlineModeSwitched {
	if ([[[NSUserDefaults standardUserDefaults] objectForKey:FirstTimeKey] isEqualToString:@"YUP"]) {
		[self clearPlayerData];
		[self refreshPlayers];
		[[NSUserDefaults standardUserDefaults] setObject:@"NOPE" forKey:FirstTimeKey];
	}
    [self.refreshPlayerButton setEnabled:!self.offlineModeSwitch.isOn];
}

- (void)refreshPlayers {
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		[_delegate refreshPlayers];
	});
}

- (void)clearPlayerData {
	AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = [appDelegate managedObjectContext];
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"BrewersPlayer" inManagedObjectContext:moc]];
    NSArray* fetchResults = [moc executeFetchRequest:fetchRequest error:nil];
    for (id player in fetchResults) {
        [moc deleteObject:player];
    }
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
