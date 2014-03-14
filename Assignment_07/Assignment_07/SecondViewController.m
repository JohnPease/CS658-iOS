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
@property(nonatomic, strong) NSArray* soundNames;
@property(nonatomic, strong) NSString* soundIcon;
@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _sounds     = [[NSMutableArray alloc] init];
    _soundNames = [[NSArray alloc] initWithObjects:@"DrSteveBrule", @"ForYourHealth", @"Mousse", @"JustHoseItOff", @"Cool", @"Fashion Victim", @"ThinkOfThat", @"Diarrhea", nil];
    _soundIcon  = @"Brule.png";
    [self addSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addSounds {
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

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sounds count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Configure the cell...
    cell.textLabel.text     = [[self.sounds objectAtIndex:indexPath.row] name];
    UIImage* uiImage        = [UIImage imageNamed:self.soundIcon];
    cell.imageView.image    = uiImage;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Sound* sound = [self.sounds objectAtIndex:indexPath.row];
    [sound.audioPlayer prepareToPlay];
    [sound.audioPlayer play];
}

@end
