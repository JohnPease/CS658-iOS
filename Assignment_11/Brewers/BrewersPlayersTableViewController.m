//
//  BrewersPlayersTableViewController.m
//  Brewers
//
//  Created by John Pease on 3/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "BrewersPlayersTableViewController.h"
#import "BrewersPlayer.h"
#import "BrewersPlayerDetailViewController.h"
#import "BrewersAddEditPlayerViewController.h"
#import "AppDelegate.h"

@interface BrewersPlayersTableViewController ()

@property(nonatomic, strong) BrewersPlayer* tempPlayer;

@end

@implementation BrewersPlayersTableViewController

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
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer)];
    self.navigationItem.rightBarButtonItems = @[addButton, self.editButtonItem];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
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
    return self.players.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [[self.players objectAtIndex:indexPath.row] fullName];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		BrewersPlayer* player = [self.players objectAtIndex:indexPath.row];
        // Delete the row from the data source
        [self.players removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
		NSManagedObjectContext* moc = [appDelegate managedObjectContext];
		[moc deleteObject:player];
		
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    BrewersPlayer* player = [self.players objectAtIndex:fromIndexPath.row];
    [self.players removeObjectAtIndex:fromIndexPath.row];
    [self.players insertObject:player atIndex:toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return NO;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"showPlayerDetailSegue"]) {
        BrewersPlayerDetailViewController* dest = [segue destinationViewController];
        UITableViewCell* cell = (UITableViewCell*)sender;
        dest.player = [self.players objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        dest.navigationItem.title = cell.textLabel.text;
    }
    else if([segue.identifier isEqualToString:@"addPlayerSegue"]) {
        BrewersAddEditPlayerViewController* dest = [segue destinationViewController];
        dest.navigationItem.title = @"Add Player";
        dest.player = self.tempPlayer;
        dest.delegate = self;
		dest.isAdd = [NSNumber numberWithBool:YES];
    }
}
 -(void)addPlayer
 {
	 AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
	 NSManagedObjectContext* moc = [appDelegate managedObjectContext];
	 
     self.tempPlayer = [NSEntityDescription insertNewObjectForEntityForName:@"BrewersPlayer" inManagedObjectContext:moc];
     self.tempPlayer.position = [NSNumber numberWithInt:self.position];
 
     [self performSegueWithIdentifier:@"addPlayerSegue" sender:self];
 }
 
 #pragma mark - BrewersAddPlayerViewController
 
 -(void)doneAddPlayer
 {
	 for (int i = 0; i < self.players.count; ++i) {
		 BrewersPlayer* player = [self.players objectAtIndex:i];
		 if ([player.lastName compare:self.tempPlayer.lastName] == NSOrderedDescending) {
			 [self.players insertObject:self.tempPlayer atIndex:i];
			 return;
		 }
	 }
	 [self.players addObject:self.tempPlayer];
 }
 
 -(void)cancelAddPlayer
 {
	 AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
	 NSManagedObjectContext* moc = [appDelegate managedObjectContext];
	 [moc deleteObject:self.tempPlayer];
     self.tempPlayer = nil;
 }


@end
