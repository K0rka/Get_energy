//
//  TagsCell.m
//  Get_Energy
//
//  Created by Catherine Korovkina on 05.07.14.
//  Copyright (c) 2014 Korovkina. All rights reserved.
//

#import "TagsCell.h"

@implementation TagsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    [_selectionImageView setBackgroundColor:selected ? [UIColor greenColor] : [UIColor clearColor]];

}

@end
