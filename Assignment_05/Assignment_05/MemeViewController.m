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
    
    self.upperTextView.delegate = self;
    self.lowerTextView.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* respond to gestures */
- (IBAction)imageTapped:(id)sender {
    
    if (_imageView.image == nil) {
        UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        } else {
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else {
        [self.view endEditing:YES];
    }
}

- (IBAction)textViewDragged:(id)sender {
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer*)sender;
    CGPoint loc = [pan translationInView:[pan view]];
    
   [pan view].center = CGPointMake([pan view].center.x, [pan view].center.y + loc.y);
   [sender setTranslation:loc inView:[pan view]];
   [sender setTranslation:CGPointZero inView:[pan view]];
}

/* ImagePicker delegate */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
    
    /* set text to impact */
    UIFont* font = [UIFont fontWithName:@"Impact" size:18];
    [self.upperTextView setText:@"enter text here"];
    [self.lowerTextView setText:@"enter text here"];
    self.upperTextView.font = font;
    self.lowerTextView.font = font;
    self.upperTextView.textColor = [UIColor whiteColor];
    self.lowerTextView.textColor = [UIColor whiteColor];
    self.upperTextView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.lowerTextView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.upperTextView.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.lowerTextView.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.upperTextView.layer.shadowOpacity = 1.0f;
    self.lowerTextView.layer.shadowOpacity = 1.0f;
    self.upperTextView.layer.shadowRadius = 2.0f;
    self.lowerTextView.layer.shadowRadius = 2.0f;
}

/* UITextView delegate */
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"here");
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    CGFloat keyboardHeight = 0;
    
    
    if (UIDeviceOrientationIsLandscape(orientation)) {
        keyboardHeight = 162;
    } else if (UIDeviceOrientationIsPortrait(orientation)) {
        keyboardHeight = 216;
    }
    NSLog(@"%f", textView.center.y);
    
    if (textView.center.y > self.view.bounds.size.height - keyboardHeight) {
        [UIView beginAnimations:Nil context:Nil];
        [UIView setAnimationDuration:0.3];
        if (UIDeviceOrientationIsPortrait(orientation)) {
            self.view.frame = CGRectOffset(self.view.frame, 0, keyboardHeight*-1);
        } else {
            self.view.frame = CGRectOffset(self.view.frame, keyboardHeight*-1, 0);
        }
        [UIView commitAnimations];
    }
    
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"here again");
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    CGFloat keyboardHeight = 0;
    
    if (UIDeviceOrientationIsLandscape(orientation)) {
        keyboardHeight = 162;
    } else if (UIDeviceOrientationIsPortrait(orientation)) {
        keyboardHeight = 216;
    }
    NSLog(@"%f", textView.center.y);
    
    if (textView.center.y > self.view.bounds.size.height - keyboardHeight) {
        [UIView beginAnimations:Nil context:Nil];
        [UIView setAnimationDuration:0.3];
        if (UIDeviceOrientationIsPortrait(orientation)) {
            self.view.frame = CGRectOffset(self.view.frame, 0, keyboardHeight*1);
        } else {
            self.view.frame = CGRectOffset(self.view.frame, keyboardHeight*1, 0);
        }
        [UIView commitAnimations];
    }
}

@end
