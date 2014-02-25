//
//  ViewController.m
//  Assignment_05
//
//  Created by John Pease on 2/24/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "MemeViewController.h"

@interface MemeViewController ()

@end

@implementation MemeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* ImagePicker delegate */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
