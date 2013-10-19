//
//  RSTitleLabel.m
//  RecoSaver
//
//  Created by Diana on 10/19/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import "RSTitleLabel.h"

@implementation RSTitleLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.font = [UIFont fontWithName:@"Futura-CondensedMedium" size:32];
        self.textAlignment = NSTextAlignmentCenter;
        CGFloat color = 108.0/255;
        self.textColor = [UIColor colorWithRed:color green:color blue:color alpha:1];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
