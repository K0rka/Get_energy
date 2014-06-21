//
//  MethodsListVC.m
//  Get_Energy
//
//  Created by Korovkina on 10.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import "MethodsListVC.h"
#import <NSManagedObjectContext+MagicalRecord.h>
#import "GE_Method.h"
#import <NSManagedObject+MagicalRequests.h>
#import <NSManagedObjectContext+MagicalSaves.h>
#import <NSManagedObject+MagicalRecord.h>
#import <NSManagedObject+MagicalDataImport.h>
#import "DetailMethodDescriptionVC.h"
#import "ItemCell.h"
#import "UIAlertView+Blocks.h"
#import "CreateOwnMethodVC.h"

@interface MethodsListVC () <ItemCellDelegate>{
    ItemCell *_selectedCell;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MethodsListVC

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
    
//    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
//                                                                                                                  action:@selector(addNewMethod:)]];
//    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onEditFilterPressed:)]];
    
    self.managedObjectContext = [NSManagedObjectContext MR_context];
    
    
    NSString *placesPath = [[NSBundle mainBundle] pathForResource:@"methods" ofType:@"json"];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:placesPath] options:0 error:nil];

//#warning Move to app delegate and do it only ince per each app
//    //Parse json and save to persistent store 
//    for (id nextObject in [dict valueForKey:@"methods"]) {
//        id method = [GE_Method MR_importFromObject:nextObject inContext:self.managedObjectContext];
//    }
//    //save context with new objects
//    [self.managedObjectContext MR_saveToPersistentStoreAndWait];
    
    //create frc, clear its cache
    NSFetchRequest *requestForFRC = [GE_Method MR_requestAll];
    NSSortDescriptor *sortDescriptorForFRC = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    [requestForFRC setSortDescriptors:@[sortDescriptorForFRC]];
    [requestForFRC setIncludesSubentities:YES];
    
    [NSFetchedResultsController deleteCacheWithName:@"Methods name"];
    self.fetchedResultController = [[NSFetchedResultsController alloc] initWithFetchRequest:requestForFRC
                                                                       managedObjectContext:self.managedObjectContext
                                                                         sectionNameKeyPath:nil
                                                                                  cacheName:@"Methods name"];
    
    
    [self.fetchedResultController performFetch:nil];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ItemCell" bundle:nil] forCellReuseIdentifier:@"ItemCell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




////////////////////////////////////////////////////////////////////////
#pragma mark - table view
////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell"];//[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewCell"];
    
    GE_Method *current = [self.fetchedResultController objectAtIndexPath:indexPath];
    [cell.textLabel setText:current.title];
    cell.delegate = self;
    UILongPressGestureRecognizer *rcgn = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(didLongPressOnCell:)];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    [cell addGestureRecognizer:rcgn];
    return  cell;
}


//==============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultController.fetchedObjects.count;
}


//==============================================================================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailMethodDescriptionVC *vc = [[DetailMethodDescriptionVC alloc] initDetailControllerWithMethod:[self.fetchedResultController objectAtIndexPath:indexPath]];
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_selectedCell.additionalView setHidden:YES];
    _selectedCell = nil;
}


- (void)didLongPressOnCell:(UILongPressGestureRecognizer *)rcg {
    [_selectedCell.additionalView setHidden:YES];
    ItemCell *cell = (ItemCell *)rcg.view;
    _selectedCell = cell;
    [cell.additionalView setHidden:NO];
}


#pragma - ItemCellDelegate
- (void) onDontPressed:(ItemCell *)cell {
    
    RIButtonItem *okItem =[RIButtonItem itemWithLabel:NSLocalizedString(@"OK", nil) action:^{
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        GE_Method *current = [self.fetchedResultController objectAtIndexPath:indexPath];
        [self.managedObjectContext deleteObject:current];
        [self.managedObjectContext save:nil];
        
    }];
    RIButtonItem *cancelItem = [RIButtonItem itemWithLabel:NSLocalizedString(@"Cancel", nil)];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Confirmation", nil) message:NSLocalizedString(@"_are_you_sure", nil) cancelButtonItem:cancelItem otherButtonItems:okItem, nil];
    [alert show];
    
}

- (void) onEditPressed:(ItemCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    GE_Method *current = [self.fetchedResultController objectAtIndexPath:indexPath];
    CreateOwnMethodVC *vc = [[CreateOwnMethodVC alloc] initWithExistringMethod:current];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) onDonePressed:(ItemCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    GE_Method *current = [self.fetchedResultController objectAtIndexPath:indexPath];
    current.doneCountValue ++;
    [[NSManagedObjectContext MR_context] save:nil];
}


- (IBAction)addNewMethod:(id)sender {
    CreateOwnMethodVC *vc = [CreateOwnMethodVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onEditFilterPressed:(id)sender {
}
@end
