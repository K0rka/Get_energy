//
//  ItemCell.m
//  Get_Energy
//
//  Created by Catherine Korovkina on 15.06.14.
//  Copyright (c) 2014 Korovkina. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onEditPressed:(UIButton *)sender {
    [_delegate onEditPressed:self];
}

- (IBAction)onDontPressed:(UIButton *)sender {
    [_delegate onDontPressed:self];
    
}

- (IBAction)onDonePressed:(UIButton *)sender {
    [_delegate onDonePressed:self];
}

@end
