//
//  MasterViewController.h
//  Get_Energy
//
//  Created by Korovkina on 02.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

#import <CoreData/CoreData.h>

/**
	Main tab bar view controller. Has no special logic
 */
@interface MasterViewController : UITabBarController <NSFetchedResultsControllerDelegate, UITabBarControllerDelegate, UITabBarDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
