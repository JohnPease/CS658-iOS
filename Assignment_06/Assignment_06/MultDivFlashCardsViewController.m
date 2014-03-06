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
@property(nonatomic, strong)UIView* horizontalLine;
@property(nonatomic, strong)UIView* verticalLine;
@end

@implementation MultDivFlashCardsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.isQuestionDisplayed = YES;
    [self generateEquation];
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
    [self resetUI];
    if (operation == 0) {
        [self generateMultiplicationProblem];
        self.equationType = [NSString stringWithFormat:MULT];
    } else {
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
    self.horizontalLine = [[UIView alloc] init];
    CGFloat xCoordinate = self.leftLabel.frame.origin.x;
    CGFloat yCoordinate = self.leftLabel.frame.origin.y + self.leftLabel.frame.size.height;
    CGFloat width = self.leftLabel.frame.size.width + self.rightLabel.frame.size.width;
    self.horizontalLine.frame = CGRectMake(xCoordinate, yCoordinate, width, 5);
    self.horizontalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.horizontalLine];
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
    
    /* set horizontal line */
    self.horizontalLine = [[UIView alloc] init];
    CGFloat xCoordinate = self.rightLabel.frame.origin.x;
    CGFloat yCoordinate = self.rightLabel.frame.origin.y;
    CGFloat width = self.rightLabel.frame.size.width;
    self.horizontalLine.frame = CGRectMake(xCoordinate, yCoordinate, width, 5);
    self.horizontalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.horizontalLine];
    
    /* set vertical line */
    self.verticalLine = [[UIView alloc] init];
    xCoordinate = self.rightLabel.frame.origin.x;
    yCoordinate = self.rightLabel.frame.origin.y;
    CGFloat height = self.rightLabel.frame.size.height;
    self.verticalLine.frame = CGRectMake(xCoordinate, yCoordinate, 5, height);
    self.verticalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.verticalLine];
}

- (void)resetUI {
    [self.leftLabel setText:@""];
    [self.topLabel setText:@""];
    [self.rightLabel setText:@""];
    [self.bottomLabel setText:@""];
    
    if ([self.view.subviews containsObject:self.verticalLine]) [self.verticalLine removeFromSuperview];
    if ([self.view.subviews containsObject:self.horizontalLine]) [self.horizontalLine removeFromSuperview];
}

@end