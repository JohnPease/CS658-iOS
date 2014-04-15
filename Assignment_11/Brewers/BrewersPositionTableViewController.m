//
//  BrewersPositionTableViewController.m
//  Brewers
//
//  Created by John Pease on 3/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "BrewersPositionTableViewController.h"
#import "BrewersPlayersTableViewController.h"
#import "BrewersPlayer.h"
#import "AppDelegate.h"

@interface BrewersPositionTableViewController ()

@property(nonatomic, strong) NSArray* allPositions;
@property(nonatomic, strong) NSMutableArray* pitcher;
@property(nonatomic, strong) NSMutableArray* catcher;
@property(nonatomic, strong) NSMutableArray* firstBase;
@property(nonatomic, strong) NSMutableArray* secondBase;
@property(nonatomic, strong) NSMutableArray* thirdBase;
@property(nonatomic, strong) NSMutableArray* shortstop;
@property(nonatomic, strong) NSMutableArray* leftField;
@property(nonatomic, strong) NSMutableArray* centerField;
@property(nonatomic, strong) NSMutableArray* rightField;

@end

@implementation BrewersPositionTableViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 9;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	
    BrewersPlayersTableViewController* dest = [segue destinationViewController];
    Position position = [self.tableView indexPathForSelectedRow].row + 1;
	dest.position = position;
    dest.players = [self playersForPosition:position];
    dest.navigationItem.title = [BrewersPlayer nameForPosition:position];
}

- (NSMutableArray*)playersForPosition:(Position)position {
	
	AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
	NSManagedObjectContext* moc = [appDelegate managedObjectContext];
	
	NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription* entity = [NSEntityDescription entityForName:@"BrewersPlayer" inManagedObjectContext:moc];
	[fetchRequest setEntity:entity];
	
	NSSortDescriptor* sortByName = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
	[fetchRequest setSortDescriptors:@[sortByName]];
	
	NSPredicate* predicate = [NSPredicate predicateWithFormat:@"position == %i", position];
	[fetchRequest setPredicate:predicate];
	
	NSError* error = nil;
	NSMutableArray* fetchResult = [NSMutableArray arrayWithArray:[moc executeFetchRequest:fetchRequest error:&error]];
	
	if (!fetchResult) {
		NSLog(@"Unresolved error %@@, %@", error, [error userInfo]);
	}
	
	return fetchResult;
}

@end
