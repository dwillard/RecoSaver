//
//  RSShowRecoViewController.h
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSReco;

@interface RSShowRecoViewController : UIViewController

@property (strong, nonatomic) RSReco *reco;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *recommendedByLabel;

@end
