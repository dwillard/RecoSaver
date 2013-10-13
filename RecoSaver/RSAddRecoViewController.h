//
//  RSAddRecoViewController.h
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSReco;

@interface RSAddRecoViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) RSReco *reco;

@property (weak, nonatomic) IBOutlet UITextField *NameTextField;
@property (weak, nonatomic) IBOutlet UITextField *DescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *LocationTextField;
@property (weak, nonatomic) IBOutlet UITextField *RecommendedByTextField;


@end
