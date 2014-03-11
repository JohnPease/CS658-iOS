//
//  CatSound.h
//  Assignment_07
//
//  Created by John Pease on 3/10/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface CatSound : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) AVAudioPlayer* audioPlayer;

- (id)initWithName:(NSString*)name audioPlayer:(AVAudioPlayer*)audioPlayer;

@end