//
//  MethodDescriptionCell.m
//  Get_Energy
//
//  Created by Korovkina on 23.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import "MethodDescriptionCell.h"

#define LABEL_WIDTH 294.
#define LABEL_FONT_SIZE 14
#define MIN_CELL_HEIGHT 44
#define ADDITIONAL_HEIGHT 20


@implementation MethodDescriptionCell

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


////////////////////////////////////////////////////////////////////////
#pragma mark - Cell height protocol
////////////////////////////////////////////////////////////////////////
+ (CGFloat)cellHeightWithData:(NSString *)data {
    CGSize sizeOfFont = [data sizeWithFont:[UIFont systemFontOfSize:LABEL_FONT_SIZE] constrainedToSize:CGSizeMake(LABEL_WIDTH, CGFLOAT_MAX)];
    
    return sizeOfFont.height + ADDITIONAL_HEIGHT < MIN_CELL_HEIGHT ? MIN_CELL_HEIGHT : sizeOfFont.height + ADDITIONAL_HEIGHT;
}


@end
