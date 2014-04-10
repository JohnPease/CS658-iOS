//
//  BaseballPlayer.h
//  Assignment_10
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseballPlayer : NSObject <NSCoding>

@property(nonatomic, strong) NSString* firstName;
@property(nonatomic, strong) NSString* lastName;
@property(nonatomic, strong) NSString* position;
@property(nonatomic, strong) NSString* url;

- (id)init;
- (id)initWithFirstName: (NSString*)firstName lastName:(NSString*)lastName position:(NSString*)position;
- (NSString*)fullName;

- (void)encodeWithCoder:(NSCoder *)aCoder;
- (id)initWithCoder:(NSCoder *)aDecoder;

@end
