//
//  CreateOwnMethodVC.h
//  Get_Energy
//
//  Created by Korovkina on 10.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GE_Method.h"
#import "NSString+StringAdditions.h"

@interface CreateOwnMethodVC : UIViewController

- (id) initWithExistringMethod:(GE_Method *)method;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
