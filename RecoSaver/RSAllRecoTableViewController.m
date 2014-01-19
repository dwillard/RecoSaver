//
//  RSAllRecoTableViewController.m
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import "RSAllRecoTableViewController.h"
#import "RSReco.h"
#import "RSRecoDataController.h"
#import "RSShowRecoViewController.h"
#import "RSAddRecoViewController.h"
#import "RSTitleLabel.h"

@interface RSAllRecoTableViewController ()
@end

@implementation RSAllRecoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) awakeFromNib {
    self.dataController = [RSRecoDataController new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  

    PFQuery *query = [RSReco query];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
      if (!error) {
          _dataController.recoArray = [objects mutableCopy];
          [[self tableView] reloadData];
      }
    }];
 

    // Customize the navbar title
    RSTitleLabel *label = [[RSTitleLabel alloc] initWithFrame:CGRectZero];
    label.text = @"R E X";
    self.navigationItem.titleView = label;
    [label sizeToFit];
    
    // Customize the back button for this view controller
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"BACK" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _dataController.numRecos;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RSRecoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    RSReco *reco = [_dataController objectInRecoArrayAtIndex:indexPath.row];
    [cell.textLabel setText: reco.name];
    [cell.textLabel setFont: [UIFont fontWithName:@"Futura-CondensedMedium" size:20]];
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier  isEqual: @"RSShowRecoSegue"]) {
        RSShowRecoViewController *showRecoViewController = segue.destinationViewController;
        showRecoViewController.delegate = self;
        showRecoViewController.reco = [_dataController objectInRecoArrayAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"createdNewReco"]) {
        RSAddRecoViewController *addRecoViewController = segue.sourceViewController;
        if (addRecoViewController.reco) {
            [_dataController addRecoArrayObject:addRecoViewController.reco];
            [self.tableView reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelNewReco"]) {
        [self dismissViewControllerAnimated:YES completion:nil];        
    }
}

- (void) handleRecoDeletion:(RSReco *)reco {
    
    NSLog(@"handling deletion");
    [_dataController removeRecoFromArray:reco];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
