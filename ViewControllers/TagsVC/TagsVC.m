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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
