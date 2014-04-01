//
//  RostersPlayerDetailViewController.m
//  Assignment_09
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "RostersPlayerDetailViewController.h"
#import "RostersEditPlayerViewController.h"
#import "RostersPlayerWebViewController.h"
#import "BaseballPlayer.h"

@interface RostersPlayerDetailViewController ()

@end

@implementation RostersPlayerDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
	self.firstNameLabel.text = self.player.firstName;
	self.lastNameLabel.text = self.player.lastName;
	self.positionLabel.text = self.player.position;
	if (self.player.url == nil || [self.player.url isEqualToString:@""]) {
		self.moreInfoButton.enabled = NO;
	} else {
		self.moreInfoButton.enabled = YES;
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	if ([segue.identifier isEqualToString:@"editPlayerSegue"]) {
		RostersEditPlayerViewController* dest = [segue destinationViewController];
		dest.player = self.player;
	} else if([segue.identifier isEqualToString:@"showPlayerWebViewSegue"]) {
		RostersPlayerWebViewController* dest = [segue destinationViewController];
		dest.playerUrl = self.player.url;
	}
}

@end
