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

@interface MethodsListVC ()
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
    self.managedObjectContext = [NSManagedObjectContext MR_context];
    
    
    GE_Method *tempMethod = [GE_Method MR_createInContext:self.managedObjectContext];;
    tempMethod.title = @"Temp";
    tempMethod.methodDescription = @"temp description";
    [self.managedObjectContext insertObject:tempMethod];
    
    [self.managedObjectContext MR_saveToPersistentStoreWithCompletion:nil];
    
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
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewCell"];
    
    GE_Method *current = [self.fetchedResultController objectAtIndexPath:indexPath];
    [cell.textLabel setText:current.title];
    return  cell;
}


//==============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultController.fetchedObjects.count;
}
@end
