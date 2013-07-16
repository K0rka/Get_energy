//
//  DetailMethodDescriptionVC.m
//  Get_Energy
//
//  Created by Korovkina on 15.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import "DetailMethodDescriptionVC.h"
#import "GE_Method.h"
@interface DetailMethodDescriptionVC () <UITableViewDataSource, UITableViewDelegate> {
    GE_Method *_currentMethod;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DetailMethodDescriptionVC

//==============================================================================
- (id) initDetailControllerWithMethod:(GE_Method *) method {
    
    self = [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailMethodDescriptionVC"];
    if (self) {
        _currentMethod = method;
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
#pragma mark - Table view
////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


//==============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"DetailCell"];
    
    cell.textLabel.text = _currentMethod.title;
    cell.detailTextLabel.text = _currentMethod.methodDescription;
    
    return cell;
}

@end
