//
//  ViewController.h
//  Assignment_05
//
//  Created by John Pease on 2/24/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate>

@property(nonatomic, weak) IBOutlet UIImageView* imageView;

@property(nonatomic, weak) IBOutlet UITextView *upperTextView;
@property(nonatomic, weak) IBOutlet UITextView *lowerTextView;

@end
