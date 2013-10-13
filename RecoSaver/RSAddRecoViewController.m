//
//  RSAddRecoViewController.m
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import "RSAddRecoViewController.h"
#import "RSReco.h"

@interface RSAddRecoViewController ()
@end

@implementation RSAddRecoViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"createdNewReco"]) {
        if (self.NameTextField.text.length) {
            _reco = [RSReco object];
            _reco.name = _NameTextField.text;
            _reco.recoDescription = _DescriptionTextField.text;
            _reco.location = _LocationTextField.text;
            _reco.recommendedBy = _RecommendedByTextField.text;
            _reco.user = [PFUser currentUser];
            
            [_reco save];
            //[_reco saveEventually];
        }
    }
}


@end
