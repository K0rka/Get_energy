//
//  CreateOwnMethodVC.m
//  Get_Energy
//
//  Created by Korovkina on 10.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import "CreateOwnMethodVC.h"
#import "CreateOwnMethodCell.h"
#import <NSManagedObject+MagicalRecord.h>
#import <NSManagedObjectContext+MagicalRecord.h>
#import <NSManagedObjectContext+MagicalSaves.h>


#define indexPathForTitleCell  [NSIndexPath indexPathForRow:0 inSection:0]

@interface CreateOwnMethodVC () {
    GE_Method *_currentMethod;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBarButtonItem;

@end

@implementation CreateOwnMethodVC

- (id) initWithExistringMethod:(GE_Method *)method {
    self =  [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CreateOwnMethodVC"];//initWithNibName:nil bundle:nil];
    if (self) {
        _currentMethod = method;
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self =  [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CreateOwnMethodVC"];//initWithNibName:nil bundle:nil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView.rowHeight = 44.;
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
    cell.textField.placeholder = [[GE_Method methodAttributes] objectAtIndex:indexPath.row];
    
//    if ([_currentMethod valueForKey:[[GE_Method methodAttributes] objectAtIndex:indexPath.row]]) {
//        cell.descriptionTextView.text =
//    }
//    
    return cell;
}


////////////////////////////////////////////////////////////////////////
#pragma mark - User Actions
////////////////////////////////////////////////////////////////////////
- (IBAction)onSavePressed:(id)sender {
    if (!_currentMethod) {
        NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
        GE_Method *newMethod = [GE_Method MR_createInContext:context];
        CreateOwnMethodCell *cellWithTitle = (CreateOwnMethodCell *)[self.tableView cellForRowAtIndexPath:indexPathForTitleCell];
        NSString *title = cellWithTitle.textField.text;
        if (!title.length) {
            title = NSLocalizedString(@"_without_title", nil);
        }
        newMethod.title = title;
        
        [context MR_saveToPersistentStoreWithCompletion:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
