//
//  CellHeightProtocol.h
//  Get_Energy
//
//  Created by Korovkina on 23.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
	Protocol, that cells with various height should implement
 */
@protocol CellHeightProtocol <NSObject>

/**
    Method to get cell height necessary to show givane data
    @param data data that will be shown in cell
    @returns height of cell
 */
+ (CGFloat) cellHeightWithData:(id)data;

@end

