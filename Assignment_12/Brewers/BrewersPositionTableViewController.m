//
//  BrewersPositionTableViewController.m
//  Brewers
//
//  Created by John Pease on 3/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "BrewersPositionTableViewController.h"
#import "BrewersPlayersTableViewController.h"
#import "BrewersSettingsTableViewController.h"
#import "BrewersPlayer.h"
#import "AppDelegate.h"

@interface BrewersPositionTableViewController ()

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
    
    UIBarButtonItem* settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStyleBordered target:self action:@selector(showSettings)];
    self.toolbarItems = @[settingsButton];
    self.navigationController.toolbarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
	self.navigationController.toolbarHidden = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
	self.navigationController.toolbarHidden = YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}

-(void)showSettings {
    [self performSegueWithIdentifier:@"ShowSettingsSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ShowSettingsSegue"]) {
        BrewersSettingsTableViewController* dest = [segue destinationViewController];
        dest.delegate = self;
    } else {
        BrewersPlayersTableViewController* dest = [segue destinationViewController];
        Position position = (Position)[self.tableView indexPathForSelectedRow].row+1;
        dest.players = [self playersForPosition:position];
        dest.position = position;
        dest.navigationItem.title = [BrewersPlayer nameForPosition:position];
    }
}

-(NSMutableArray*)playersForPosition:(Position)position
{
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = [appDelegate managedObjectContext];
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"BrewersPlayer" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor* sortByName = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortByName]];
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"position = %i", position];
    [fetchRequest setPredicate:predicate];
    
    NSError* error = nil;
    NSMutableArray* fetchResults = [NSMutableArray arrayWithArray:[moc executeFetchRequest:fetchRequest error:&error]];
    
    if(!fetchResults) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    } else if (fetchResults.count == 0 && [[[NSUserDefaults standardUserDefaults] objectForKey:OfflineModeKey] isEqualToString:@"NO"]) {
		//obtain players from web service
		fetchResults = [self playersFromWebServiceForPosition:position withMoc:moc];
	}
    
    return fetchResults;
}

- (NSMutableArray*)playersFromWebServiceForPosition:(Position)position withMoc:(NSManagedObjectContext*)moc {
	NSString* brewersPlayerURLString = [NSString stringWithFormat:@"http://api.cbssports.com/fantasy/players/search?SPORT=baseball&version=3.0&response_format=json&pro_team=MIL"];
	NSString* brewersPlayersByPositionURLString = [brewersPlayerURLString stringByAppendingFormat:@"&position=%@", [BrewersPlayer identifierForPosition:position]];
	NSURL* brewersPlayersByPositionURL = [NSURL URLWithString:brewersPlayersByPositionURLString];
	NSData* data = [NSData dataWithContentsOfURL:brewersPlayersByPositionURL];
	
	//make dictionary from json response
	NSError* error = nil;
	NSDictionary* jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	NSDictionary* bodyDictionary = [jsonDictionary objectForKey:@"body"];
	NSArray* playerDictionaries = [bodyDictionary objectForKey:@"players"];
	
	BrewersPlayer* player;
	NSMutableArray* players = [[NSMutableArray alloc] init];
	for (NSDictionary* playerDictionary in playerDictionaries) {
		player = [NSEntityDescription insertNewObjectForEntityForName:@"BrewersPlayer" inManagedObjectContext:moc];
		player.firstName = [playerDictionary objectForKey:@"firstname"];
		player.lastName = [playerDictionary objectForKey:@"lastname"];
		player.position = [NSNumber numberWithInt:position];
		player.infoUrl = [@"http://www.cbssports.com/mlb/players/playerpage/" stringByAppendingString:[playerDictionary objectForKey:@"id"]];
		NSURL* headshotUrl = [NSURL URLWithString:[playerDictionary objectForKey:@"photo_url"]];
		player.headshot = [NSData dataWithContentsOfURL:headshotUrl];
		
		[players addObject:player];
	}
	return players;
}

- (void)refreshPlayers {
	AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
	NSManagedObjectContext* moc = [appDelegate managedObjectContext];
	
    for (int pos = 0; pos <= 10; ++pos) {
        [self playersFromWebServiceForPosition:pos withMoc:moc];
    }
}

@end
