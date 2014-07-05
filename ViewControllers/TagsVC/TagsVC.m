//
//  TagsVC.m
//  Get_Energy
//
//  Created by Catherine Korovkina on 05.07.14.
//  Copyright (c) 2014 Korovkina. All rights reserved.
//

#import "TagsVC.h"
#import "Tag.h"
#import <NSManagedObject+MagicalAggregation.h>
#import <NSManagedObject+MagicalRequests.h>
#import "TagsCell.h"
#import "UIAlertView+Blocks.h"

@interface TagsVC ()
@property (nonatomic, strong) NSFetchedResultsController *frc;


@end

@implementation TagsVC

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [NSFetchedResultsController deleteCacheWithName:@"Tags"];
    NSFetchRequest *request = [Tag MR_requestAllSortedBy:@"tagName" ascending:YES];
    self.frc  = [[NSFetchedResultsController alloc] initWithFetchRequest:request//[Tag MR_requestAll]
                                                    managedObjectContext:[NSManagedObjectContext MR_defaultContext]
                                                      sectionNameKeyPath:nil
                                                               cacheName:@"Tags"];
    [self.frc performFetch:nil];

    self.frc.delegate = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//return [NSManag]
    return self.frc.fetchedObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TagsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TagsCell" forIndexPath:indexPath];
    Tag *tag = [self.frc objectAtIndexPath:indexPath];
    cell.titleLabel.text = tag.tagName;
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        __weak TagsVC *wSelf = self;
        [[NSManagedObjectContext MR_defaultContext] deleteObject:[wSelf.frc objectAtIndexPath:indexPath]];
        [[NSManagedObjectContext MR_defaultContext ] save:nil];
//        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
//            [[] deleteObject:[wSelf.frc objectAtIndexPath:indexPath]];
//        }];
    }
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return NSLocalizedString(@"Delete", nil);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)addNewTag:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"New Tag", nil) message:@"New Tag Name" cancelButtonItem:[RIButtonItem itemWithLabel:NSLocalizedString(@"Cancel", nil)] otherButtonItems:nil];//initWithTitle: message: delegate:self cancelButtonTitle: otherButtonTitles:nil];
    
    RIButtonItem *okItem = [RIButtonItem itemWithLabel:NSLocalizedString(@"OK", nil) action:^{
        
        UITextField *textField = [alertView textFieldAtIndex:0];
        if (textField.text.length) {
            [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
                Tag *newTag = [Tag MR_createInContext:localContext];
                newTag.tagName = textField.text;
                
            }
             completion:^(BOOL success, NSError *error) {
                 
                 if (success) {
                     
                 }
                 else if (error) {
                     NSLog(@"error = %@", error);
                 }
             }];
        }
    }];
    [alertView addButtonItem:okItem];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
}



#pragma mark FRC
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
