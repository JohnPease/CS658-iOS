//
//  renameSound.m
//  Assignment_07
//
//  Created by John Jeffrey Pease on 3/11/14.
//  Copyright (c) 2014 John Jeffrey Pease. All rights reserved.
//

#import "Sound.h"

@implementation Sound

- (id)init {
    return [self initWithName:@"" audioPlayer:[[AVAudioPlayer alloc] init]];
}

- (id)initWithName:(NSString *)name audioPlayer:(AVAudioPlayer *)audioPlayer {
    self = [super init];
    if (self) {
        _name = name;
        _audioPlayer = audioPlayer;
    }
    return self;
}

@end
