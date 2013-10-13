//
//  RSAllRecoTableViewController.h
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSRecoDataController;

@interface RSAllRecoTableViewController : UITableViewController

@property (strong, nonatomic) RSRecoDataController *dataController;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
