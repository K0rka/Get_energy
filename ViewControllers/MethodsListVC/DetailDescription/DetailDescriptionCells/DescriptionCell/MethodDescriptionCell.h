//
//  MethodDescriptionCell.h
//  Get_Energy
//
//  Created by Korovkina on 23.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellHeightProtocol.h"

@interface MethodDescriptionCell : UITableViewCell <CellHeightProtocol>

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
