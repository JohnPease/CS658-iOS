//
//  BrewersPlayerWebViewController.h
//  Brewers
//
//  Created by John Pease on 3/17/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrewersPlayerWebViewController : UIViewController

@property(nonatomic, weak) IBOutlet UIWebView* webView;
@property(nonatomic, weak) NSString* url;

@end
