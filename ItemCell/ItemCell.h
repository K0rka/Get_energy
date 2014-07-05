//
//  ItemCell.h
//  Get_Energy
//
//  Created by Catherine Korovkina on 15.06.14.
//  Copyright (c) 2014 Korovkina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  ItemCell;
@protocol ItemCellDelegate <NSObject>

- (void) onDontPressed:(ItemCell *)cell;
- (void) onEditPressed:(ItemCell *)cell;
- (void) onDonePressed:(ItemCell *)cell;

@end

@interface ItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *additionalView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, assign) id<ItemCellDelegate> delegate;
@end
