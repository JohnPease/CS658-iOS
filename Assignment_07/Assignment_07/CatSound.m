//
//  CatSound.m
//  Assignment_07
//
//  Created by John Pease on 3/10/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "CatSound.h"

@implementation CatSound

- (id)init {
    return [self initWithName:@"" audioPlayer:[[AVAudioPlayer alloc] init]];
}

- (id)initWithName:(NSString*)name audioPlayer:(AVAudioPlayer*)audioPlayer {
    self = [super init];
    if (self) {
        _name = name;
        _audioPlayer = audioPlayer;
    }
    
    return self;
}

@end
