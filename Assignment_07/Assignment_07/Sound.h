//
//  renameSound.h
//  Assignment_07
//
//  Created by John Jeffrey Pease on 3/11/14.
//  Copyright (c) 2014 John Jeffrey Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Sound : NSObject <AVAudioPlayerDelegate>

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) AVAudioPlayer* audioPlayer;

- (id)initWithName:(NSString*)name audioPlayer:(AVAudioPlayer*)audioPlayer;

@end
