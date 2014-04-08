//
//  RostersPlayerWebViewController.h
//  Assignment_10
//
//  Created by John Pease on 4/1/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RostersPlayerWebViewController : UIViewController

@property(nonatomic, weak) IBOutlet UIWebView* webView;
@property(nonatomic, weak) NSString* playerUrl;

@end
