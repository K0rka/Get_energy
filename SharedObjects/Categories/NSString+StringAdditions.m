//
//  NSString+StringAdditions.m
//  Get_Energy
//
//  Created by Korovkina on 24.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import "NSString+StringAdditions.h"

@implementation NSString (StringAdditions)

//==============================================================================
- (NSString *)localized {
    return NSLocalizedString(self, "");
}

@end
