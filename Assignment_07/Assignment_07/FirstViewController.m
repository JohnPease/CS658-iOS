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
@property(nonatomic, strong) NSArray* soundNames;
@property(nonatomic, strong) NSArray* soundIcons;
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _sounds         = [[NSMutableArray alloc] init];
    _soundNames     = [[NSArray alloc] initWithObjects:@"LaLaLa", @"MyMistake", @"TakeAPicture", @"DrinkWater", @"ImTakingCrazyPills", @"BlueYoureMyBoy", @"NotHot", @"TyroneAnthrax", @"LookOut", @"Moon", @"MostAnnoyingSoundInTheWorld", @"Loud", @"EvenLouder", nil];
    _soundIcons     = [[NSArray alloc] initWithObjects:@"PeeWee.png", @"Ferrell.png", @"Chappelle.png", @"Dumb.png", @"Loud.png", nil];
    
    [self addSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addSounds {
    NSError *error;
    AVAudioPlayer* audioPlayer;
    NSURL* soundURL;
    NSString* soundPath;
    Sound* sound;
    
    for (NSString* soundString in _soundNames) {
        soundPath = [[NSBundle mainBundle] pathForResource:soundString ofType:@"mp3"];
        soundURL = [NSURL fileURLWithPath:soundPath];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
        sound = [[Sound alloc] initWithName:soundString audioPlayer:audioPlayer];
        [self.sounds addObject:sound];
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    int index = [self getIndex:indexPath.row withSection:indexPath.section];
    
    /* configure cell */
    cell.textLabel.text     = [[self.sounds objectAtIndex:index] name];
    UIImage* uiImage        = [UIImage imageNamed:[self.soundIcons objectAtIndex:indexPath.section]];
    cell.imageView.image    = uiImage;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = [self getIndex:indexPath.row withSection:indexPath.section];
    Sound* sound = [self.sounds objectAtIndex:index];
    [sound.audioPlayer prepareToPlay];
    [sound.audioPlayer play];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 2;
            break;
        case 4:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString* sectionName;
    
    switch (section) {
        case 0:
            sectionName = @"Pee Wee";
            break;
        case 1:
            sectionName = @"Will Ferrell";
            break;
        case 2:
            sectionName = @"Chappelle";
            break;
        case 3:
            sectionName = @"Dumb and Dumber";
            break;
        case 4:
            sectionName = @"WARNING (LOUD) (TURN VOLUME DOWN)";
            break;
        default:
            break;
    }
    
    return sectionName;
}

- (NSInteger)getIndex:(NSInteger)index withSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            index += 0;
            break;
        case 1:
            index += 3;
            break;
        case 2:
            index += 7;
            break;
        case 3:
            index += 9;
            break;
        case 4:
            index += 11;
            break;
        default:
            break;
    }
    return index;
}

@end
