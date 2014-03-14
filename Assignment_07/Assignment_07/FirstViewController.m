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
    _soundNames     = [[NSArray alloc] initWithObjects:@"LaLaLa", @"BlueYoureMyBoy", @"Loud", @"EvenLouder", @"LookOut", @"TakeAPicture", @"Moon", @"MyMistake", @"DrinkWater", @"ImTakingCrazyPills", @"TyroneAnthrax", @"MostAnnoyingSoundInTheWorld", @"NotHot", nil];
    _soundIcons     = [[NSArray alloc] initWithObjects:@"Brule.png", @"Brule.png", @"paw.png", @"paw.png", @"paw.png", @"paw.png", @"paw.png", @"paw.png", @"paw.png", @"paw.png", @"paw.png", @"paw.png", @"paw.png", nil];
    
    [self addSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addIcons {
    UIImage* uiImage;
    
    for (NSString* icon in _soundIcons) {
        uiImage = [UIImage imageNamed:icon];
    }
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
    cell.textLabel.text = [[self.sounds objectAtIndex:indexPath.row] name];
    UIImage* uiImage = [UIImage imageNamed:[self.soundIcons objectAtIndex:indexPath.row]];
    cell.imageView.image = uiImage;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Sound* sound = [self.sounds objectAtIndex:indexPath.row];
    [sound.audioPlayer prepareToPlay];
    [sound.audioPlayer play];
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
            sectionName = @"WARNING (LOUD)";
            break;
        default:
            break;
    }
    
    return sectionName;
}

@end
