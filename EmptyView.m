//
//  EmptyView.m
//  Get_Energy
//
//  Created by Ekaterina Korovkina on 07.03.15.
//  Copyright (c) 2015 Korovkina. All rights reserved.
//

#import "EmptyView.h"

@implementation EmptyView

- (IBAction)emptyButtonPressed:(id)sender {
    if ([_delegate respondsToSelector:@selector(emptyButtonWasPressedInEmptyView:)]) {
        [_delegate emptyButtonWasPressedInEmptyView:self];
    }
}
@end
