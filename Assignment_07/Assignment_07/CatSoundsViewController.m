//
//  ViewController.m
//  Assignment_07
//
//  Created by John Pease on 3/10/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "CatSoundsViewController.h"
#import "CatSound.h"

@interface CatSoundsViewController ()
@property(nonatomic, strong) NSMutableArray* sounds;
@end

@implementation CatSoundsViewController

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

- (void)addSounds {
    NSError *error;
    AVAudioPlayer* audioPlayer;
    NSURL* soundUrl;
    NSString* soundPath;
    NSString* name;
    CatSound* catSound;
    
    NSArray* sounds = [[NSArray alloc] initWithObjects:@"cat-angry", @"cat-furious", @"cat-meow", @"cat-sad", @"cat-scared", @"cat-squeak", @"cat-whining", nil];
    
    for (NSString* sound in sounds) {
        soundPath = [[NSBundle mainBundle] pathForResource:sound ofType:@"mp3"];
        soundUrl = [NSURL fileURLWithPath:soundPath];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&error];
        name = [[sound componentsSeparatedByString:@"-"][1] capitalizedString];
        catSound = [[CatSound alloc] initWithName:name audioPlayer:audioPlayer];
        [self.sounds addObject:catSound];
    }
    
    
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
    CatSound* sound = [self.sounds objectAtIndex:indexPath.row];
    [sound.audioPlayer prepareToPlay];
    [sound.audioPlayer play];
}

@end
