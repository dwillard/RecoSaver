//
//  RSShowRecoViewController.m
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import "RSShowRecoViewController.h"
#import "RSReco.h"

const float GAP = 10.0;

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
    self.automaticallyAdjustsScrollViewInsets = NO;
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

- (void) configureView {
    // only configure if there is a reco
    if (_reco) {
        self.nameLabel.text          = [_reco.name uppercaseString];
        self.descriptionLabel.text   = _reco.recoDescription;
        self.locationLabel.text      = [NSString stringWithFormat:@"Location:\n%@", _reco.location];
        self.recommendedByLabel.text = [NSString stringWithFormat:@"Recommended by:\n%@", _reco.recommendedBy];
      
        CGFloat heightSoFar = 85;
        [self.descriptionLabel sizeToFit];
      self.descriptionLabel.frame = CGRectMake(self.descriptionLabel.frame.origin.x, heightSoFar, self.descriptionLabel.frame.size.width, self.descriptionLabel.frame.size.height);
        heightSoFar += GAP + self.descriptionLabel.frame.size.height;
      
        [self.locationLabel sizeToFit];
        self.locationLabel.frame = CGRectMake(self.locationLabel.frame.origin.x, heightSoFar, self.locationLabel.frame.size.width, self.locationLabel.frame.size.height);
        heightSoFar += GAP + self.locationLabel.frame.size.height;
      
        [self.recommendedByLabel sizeToFit];
        self.recommendedByLabel.frame = CGRectMake(self.recommendedByLabel.frame.origin.x, heightSoFar, self.recommendedByLabel.frame.size.width, self.recommendedByLabel.frame.size.height);
        heightSoFar += GAP + self.recommendedByLabel.frame.size.height;

        [self.containerView sizeToFit];
        self.containerView.frame = CGRectMake(self.containerView.frame.origin.x, self.containerView.frame.origin.y, self.containerView.frame.size.width, heightSoFar);
        [self.containerView layoutIfNeeded];
    }
}

-(IBAction)deleteReco:(id) sender {
    NSLog(@"pressed delete");
    if ([_delegate respondsToSelector:@selector(handleRecoDeletion:)]) {
        [_delegate performSelectorOnMainThread:@selector(handleRecoDeletion:) withObject:_reco waitUntilDone:NO];
    }
}

@end