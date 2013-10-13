//
//  RSReco.m
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import "RSReco.h"
#import <Parse/PFObject+Subclass.h>

@implementation RSReco

@dynamic name;
@dynamic recoDescription;
@dynamic location;
@dynamic recommendedBy;
@dynamic user;

+ (NSString *)parseClassName {
  return @"RSReco";
}

@end
