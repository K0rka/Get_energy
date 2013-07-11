//
//  CreateOwnMethodVC.m
//  Get_Energy
//
//  Created by Korovkina on 10.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import "CreateOwnMethodVC.h"

@interface CreateOwnMethodVC ()

@end

@implementation CreateOwnMethodVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


////////////////////////////////////////////////////////////////////////
#pragma mark - Table view delegate/data source
////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


//==============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"index path section = %d row = %d", indexPath.section, indexPath.row ]];
    
    return cell;
}
@end
