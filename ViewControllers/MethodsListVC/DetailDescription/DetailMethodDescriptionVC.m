//
//  DetailMethodDescriptionVC.m
//  Get_Energy
//
//  Created by Korovkina on 15.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import "DetailMethodDescriptionVC.h"
#import "GE_Method.h"
#import "SharedObjectsDescriptions.h"
#import "MethodDescriptionCell.h"

@interface DetailMethodDescriptionVC () <UITableViewDataSource, UITableViewDelegate> {
    GE_Method *_currentMethod;
    //Array that contain all the fields of new method in appropriate order
    NSMutableArray *_currentMethodDescriptionArray;
    NSArray *_ge_method;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DetailMethodDescriptionVC

//==============================================================================
- (id) initDetailControllerWithMethod:(GE_Method *) method {
    
    self = [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailMethodDescriptionVC"];
    if (self) {
        _currentMethod = method;
        _currentMethodDescriptionArray = [NSMutableArray array];
    }
    return self;
}


//==============================================================================
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Set title of new controller
    self.title = [_currentMethod.title capitalizedString];
    
    
    //Table view settings
    _ge_method = @[@"title",
                   @"star",
                   @"cost",
                   @"place",
                   @"duration",
                   @"methodDescription",
                   @"peopleNumber",
                   @"preparedList"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MethodDescriptionCell" bundle:nil] forCellReuseIdentifier:@"MethodDescriptionCell"];
    [self configureStructureOfTableWithMethod:_currentMethod];
    
}


//==============================================================================
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



////////////////////////////////////////////////////////////////////////
#pragma mark - Table view
////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _currentMethodDescriptionArray.count;
}

//==============================================================================
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //data that will be shown in cell with that indexPath
    id dataForCell = [_currentMethod valueForKey:[_currentMethodDescriptionArray objectAtIndex:indexPath.row]];
    
    if ([[_currentMethodDescriptionArray objectAtIndex:indexPath.row] isEqual:@"methodDescription"]) {
        return [MethodDescriptionCell cellHeightWithData:dataForCell];
    }
    return 44;
}


//==============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id nextVal = [_currentMethod valueForKey:[_currentMethodDescriptionArray objectAtIndex:indexPath.row]];

    //Description Cell
    if ([[_currentMethodDescriptionArray objectAtIndex:indexPath.row] isEqual:@"methodDescription"]) {
        MethodDescriptionCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MethodDescriptionCell"];
        [cell.descriptionLabel setText:nextVal ];
        return cell;
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"DetailCell"];
    
    cell.textLabel.text = [_currentMethodDescriptionArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [nextVal isKindOfClass:[NSString class]]? nextVal  : [NSString stringWithFormat:@"%@", nextVal ];
    return cell;
}


////////////////////////////////////////////////////////////////////////
#pragma mark - Support
////////////////////////////////////////////////////////////////////////
- (void) configureStructureOfTableWithMethod:(GE_Method *) method {
    //clear array of prev values
    [_currentMethodDescriptionArray removeAllObjects];
    
    for (NSString *nextKey in _ge_method) {
        
        //if there's value for next key add this key into final array
        if ([method valueForKey:nextKey]) {
            [_currentMethodDescriptionArray addObject:nextKey];
        }
    }
}


////////////////////////////////////////////////////////////////////////
#pragma mark - User Actions
////////////////////////////////////////////////////////////////////////
- (IBAction)editCurrentMethod:(id)sender {
}
@end
