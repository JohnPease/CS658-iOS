//
//  ToDoListItemTableCell.m
//  ToDo
//
//  Created by John Pease on 3/7/14.
//  Copyright (c) 2014 John Pease. All rights reserved.
//

#import "ToDoListItemTableViewCell.h"
#import "ToDoListItem.h"

@implementation ToDoListItemTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.item setTitle:[NSMutableString stringWithString:textField.text]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
