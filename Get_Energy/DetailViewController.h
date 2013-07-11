//
//  DetailViewController.h
//  Get_Energy
//
//  Created by Korovkina on 02.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
