//
//  SecondViewController.m
//  Assignment_07
//
//  Created by John Jeffrey Pease on 3/11/14.
//  Copyright (c) 2014 John Jeffrey Pease. All rights reserved.
//

#import "SecondViewController.h"
#import "Sound.h"

@interface SecondViewController ()
@property(nonatomic, strong) NSMutableArray* sounds;
@end

@implementation SecondViewController

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

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sounds count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Configure the cell...
    cell.textLabel.text = [[self.sounds objectAtIndex:indexPath.row] name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Sound* sound = [self.sounds objectAtIndex:indexPath.row];
    [sound.audioPlayer prepareToPlay];
    [sound.audioPlayer play];
}

@end
