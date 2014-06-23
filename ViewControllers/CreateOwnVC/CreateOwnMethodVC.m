//
//  CreateOwnMethodVC.m
//  Get_Energy
//
//  Created by Korovkina on 10.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import "CreateOwnMethodVC.h"
#import "CreateOwnMethodCell.h"

@interface CreateOwnMethodVC () {
    GE_Method *_currentMethod;
}

@end

@implementation CreateOwnMethodVC

- (id) initWithExistringMethod:(GE_Method *)method {
    self =  [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CreateOwnMethodVC"];//initWithNibName:nil bundle:nil];
    if (self) {
        _currentMethod = method;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView.rowHeight = 70.;
    [self.tableView registerNib:[UINib nibWithNibName:@"CreateOwnMethodCell" bundle:nil] forCellReuseIdentifier:@"CreateOwnMethodCell"];
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
    
    //Cell for each attribute
    return [[GE_Method methodAttributes] count];
}


//==============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CreateOwnMethodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreateOwnMethodCell"];
    cell.nameLabel.text = [[GE_Method methodAttributes] objectAtIndex:indexPath.row];
    
//    if ([_currentMethod valueForKey:[[GE_Method methodAttributes] objectAtIndex:indexPath.row]]) {
//        cell.descriptionTextView.text =
//    }
//    
    return cell;
}


////////////////////////////////////////////////////////////////////////
#pragma mark - User Actions
////////////////////////////////////////////////////////////////////////
- (void) saveNewMethod:(UIButton *) button {
    
}
@end
