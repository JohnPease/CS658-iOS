//
//  FirstViewController.m
//  Assignment_07
//
//  Created by John Jeffrey Pease on 3/11/14.
//  Copyright (c) 2014 John Jeffrey Pease. All rights reserved.
//

#import "FirstViewController.h"
#import "Sound.h"

@interface FirstViewController ()
@property(nonatomic, strong) NSMutableArray* sounds;
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _sounds = [[NSMutableArray alloc] init];
    [self addSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addSounds {
    NSArray* allSounds = [[NSArray alloc] initWithObjects:@"LaLaLa", @"BlueYoureMyBoy", @"Loud", @"EvenLouder", @"LookOut", @"TakeAPicture", @"Moon", @"MyMistake", @"DrinkWater", @"ImTakingCrazyPills", @"TyroneAnthrax", @"MostAnnoyingSoundInTheWorld", @"NotHot", nil];
    NSError *error;
    AVAudioPlayer* audioPlayer;
    NSURL* soundURL;
    NSString* soundPath;
    Sound* sound;
    
    for (NSString* soundString in allSounds) {
        soundPath = [[NSBundle mainBundle] pathForResource:soundString ofType:@"mp3"];
        soundURL = [NSURL fileURLWithPath:soundPath];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
        sound = [[Sound alloc] initWithName:soundString audioPlayer:audioPlayer];
        [self.sounds addObject:sound];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sounds count];
}

//- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    /* configure cell */
    
    cell.textLabel.frame = CGRectMake(100, 0, 0, 0);
    cell.textLabel.text = [[self.sounds objectAtIndex:indexPath.row] name];
    UIImage* uiImage = [UIImage imageNamed:@"paw.png"];
    cell.imageView.image = uiImage;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Sound* sound = [self.sounds objectAtIndex:indexPath.row];
    [sound.audioPlayer prepareToPlay];
    [sound.audioPlayer play];
}

@end
