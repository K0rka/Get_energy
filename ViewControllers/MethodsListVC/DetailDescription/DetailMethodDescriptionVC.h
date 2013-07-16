//
//  DetailMethodDescriptionVC.h
//  Get_Energy
//
//  Created by Korovkina on 15.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GE_Method;

@interface DetailMethodDescriptionVC : UIViewController

/**
	Create detail view controller about given method
	@returns method, details of which will be shown in created controller
 */
- (id) initDetailControllerWithMethod:(GE_Method *) method;


@end
