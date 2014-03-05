//
//  MultDivViewController.m
//  Assignment_06
//
//  Created by John Jeffrey Pease on 3/4/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "MultDivFlashCardsViewController.h"
#define MULT (@"multiplication")
#define DIV (@"division")

@interface MultDivFlashCardsViewController ()
@property(nonatomic, strong) NSString* answer;
@property(nonatomic) BOOL isQuestionDisplayed;
@property(nonatomic, strong) NSString* equationType;
@end

@implementation MultDivFlashCardsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.isQuestionDisplayed = YES;
    [self generateEquation];
//    [self.answerLabel setText:@""];
    
//    UIView* underlineView = [[UIView alloc] init];
//    CGFloat xCoordinate = self.operatorLabel.frame.origin.x;
//    CGFloat yCoordinate = self.operatorLabel.frame.origin.y + self.operatorLabel.frame.size.height;
//    CGFloat width = self.operatorLabel.frame.size.width + self.operand2Label.frame.size.width;
//    underlineView.frame = CGRectMake(xCoordinate, yCoordinate, width, 5);
//    underlineView.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:underlineView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)screenTapped {
    
    if (self.isQuestionDisplayed) {
        if ([self.equationType isEqualToString:MULT]) {
            [self.bottomLabel setText:self.answer];
        } else if ([self.equationType isEqualToString:DIV]) {
            [self.topLabel setText:self.answer];
        }
        self.isQuestionDisplayed = NO;
    } else {
        [self generateEquation];
        self.isQuestionDisplayed = YES;
    }
}

- (void)generateEquation {
    int operation = arc4random_uniform(2);
    if (operation == 0) {
        [self resetUI];
        [self generateMultiplicationProblem];
        self.equationType = [NSString stringWithFormat:MULT];
    } else {
        [self resetUI];
        [self generateDivisionProblem];
        self.equationType = [NSString stringWithFormat:DIV];
    }
}

- (void)generateMultiplicationProblem {
    int multiplicand = arc4random_uniform(9) + 1;
    int multiplier = arc4random_uniform(9) + 1;
    self.answer = [NSString stringWithFormat:@"%i", multiplicand * multiplier];
    
    /* set labels */
    [self.leftLabel setText:@"x"];
    [self.topLabel setText:[NSString stringWithFormat:@"%i", multiplicand]];
    [self.rightLabel setText:[NSString stringWithFormat:@"%i", multiplier]];
    
    /* set lines */
    UIView* underlineView = [[UIView alloc] init];
    CGFloat xCoordinate = self.leftLabel.frame.origin.x;
    CGFloat yCoordinate = self.leftLabel.frame.origin.y + self.leftLabel.frame.size.height;
    CGFloat width = self.leftLabel.frame.size.width + self.rightLabel.frame.size.width;
    underlineView.frame = CGRectMake(xCoordinate, yCoordinate, width, 5);
    underlineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:underlineView];
}

- (void)generateDivisionProblem {
    int divisor = arc4random_uniform(9) + 1;
    int quotient = arc4random_uniform(10) + 1;
    int dividend = divisor * quotient;
    self.answer = [NSString stringWithFormat:@"%i", quotient];
    
    /* set labels */
    [self.topLabel setText:@""];
    [self.leftLabel setText:[NSString stringWithFormat:@"%i", divisor]];
    [self.rightLabel setText:[NSString stringWithFormat:@"%i", dividend]];
    
    /* set lines */
}

- (void)resetUI {
    [self.leftLabel setText:@""];
    [self.topLabel setText:@""];
    [self.rightLabel setText:@""];
    [self.bottomLabel setText:@""];
}

@end