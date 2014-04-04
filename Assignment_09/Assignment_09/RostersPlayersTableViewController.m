//
//  RostersPlayersTableViewController.m
//  Assignment_09
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "RostersPlayersTableViewController.h"
#import "RostersPlayerDetailViewController.h"
#import "RostersAddEditPlayerViewController.h"
#import "BaseballPlayer.h"

@interface RostersPlayersTableViewController ()
@property(nonatomic, strong) BaseballPlayer* player;
@end

@implementation RostersPlayersTableViewController

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
    
    UIBarButtonItem* add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer)];
    UIBarButtonItem* edit = self.editButtonItem;
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:add, edit, nil];
}

- (void)addPlayer {
    [self performSegueWithIdentifier:@"addPlayerSegue" sender:self];
}

- (void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [[_players objectAtIndex:indexPath.row] fullName];
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
        // Delete the row from the data source
		[self.players removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	BaseballPlayer *player = [self.players objectAtIndex:fromIndexPath.row];
	[self.players removeObjectAtIndex:fromIndexPath.row];
	[self.players insertObject:player atIndex:toIndexPath.row];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	if ([segue.identifier isEqualToString:@"showPlayerDetailSegue"]) {
		RostersPlayerDetailViewController* dest = [segue destinationViewController];
		UITableViewCell* cell = (UITableViewCell*)sender;
		dest.player = [self.players objectAtIndex:[self.tableView indexPathForSelectedRow].row];
		dest.navigationItem.title = cell.textLabel.text;
	} else if ([segue.identifier isEqualToString:@"addPlayerSegue"]) {
        RostersAddEditPlayerViewController* dest = [segue destinationViewController];
		self.player = [[BaseballPlayer alloc] init];
		self.player.position = self.navigationItem.title;
        dest.delegate = self;
        dest.player = self.player;
        dest.navigationItem.title = @"Add Player";
    }
}

#pragma mark - RosterAddPlayerDelegate

- (void)doneAddPlayer {
    if (self.player != nil) {
        [self.players addObject:self.player];
    }
}

- (void)cancelAddPlayer {
    _player = nil;
}

@end
