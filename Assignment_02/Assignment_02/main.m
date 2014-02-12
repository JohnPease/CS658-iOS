//
//  main.m
//  Assignment_02
//
//  Created by John Pease on 2/3/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BurnGenerator.h"
#import "BlankFiller.h"
#import "MadLibGenerator.h"

int main(int argc, const char * argv[])
{
    
	@autoreleasepool {
	    
	    BurnGenerator*      burnGenerator = [[BurnGenerator alloc] init];
		MadLibGenerator*    madLibGenerator = [[MadLibGenerator alloc] init];
        
        for (int i = 0; i < 3; ++i) {
            [burnGenerator setTemplates:[burnGenerator templates]];
            NSString* burns = [burnGenerator generate];
            NSLog(@"%@\n ", burns);
        }
		
        for (int i = 0; i < 3; ++i) {
            [madLibGenerator setTemplates:[madLibGenerator templates]];
            NSString* madLibs = [madLibGenerator generate];
            NSLog(@"%@\n ", madLibs);
        }
	    
	}
    return 0;
}