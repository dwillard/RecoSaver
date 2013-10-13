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
    NSLog(@"preparing for segue in AddRecoVC");
    NSLog(@"segue id: %@", segue.identifier);
    if ([[segue identifier] isEqualToString:@"createdNewReco"]) {
        NSLog(@"ran createdNewSegue");
        if (self.NameTextField.text.length) {
            _reco = [[RSReco alloc] initWithName:_NameTextField.text
                                     description:_DescriptionTextField.text
                                        location:_LocationTextField.text
                                   recommendedBy:_RecommendedByTextField.text];
        }
    }
}


@end
