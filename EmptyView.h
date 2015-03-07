//
//  EmptyView.h
//  Get_Energy
//
//  Created by Ekaterina Korovkina on 07.03.15.
//  Copyright (c) 2015 Korovkina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EmptyView;
@protocol EmptyViewDelegate <NSObject>

- (void)emptyButtonWasPressedInEmptyView:(EmptyView *)view;

@end

@interface EmptyView : UIView
@property (weak, nonatomic) IBOutlet UILabel *emptyText;
@property (weak, nonatomic) IBOutlet UIButton *emptyViewButton;
@property (weak, nonatomic) id<EmptyViewDelegate> delegate;
@end
