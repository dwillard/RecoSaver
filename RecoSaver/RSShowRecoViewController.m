//
//  RSShowRecoViewController.m
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import "RSShowRecoViewController.h"
#import "RSReco.h"

@interface RSShowRecoViewController ()

@end

@implementation RSShowRecoViewController

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
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setReco:(RSReco *)reco {
    if (_reco != reco) {
        _reco = reco;
        [self configureView];
    }
}

- (void)configureView {
    // only configure if there is a reco
    if (_reco) {    
        self.nameLabel.text          = [_reco.name uppercaseString];
        self.descriptionLabel.text   = _reco.recoDescription;
        self.locationLabel.text      = [NSString stringWithFormat:@"Location: %@", _reco.location];
        self.recommendedByLabel.text = [NSString stringWithFormat:@"Recommended by: %@", _reco.recommendedBy];
    }
}

-(IBAction)deleteReco:(id) sender {
    NSLog(@"pressed delete");
    if ([_delegate respondsToSelector:@selector(handleRecoDeletion:)]) {
        [_delegate performSelectorOnMainThread:@selector(handleRecoDeletion:) withObject:_reco waitUntilDone:NO];
    }
    
    
}

@end