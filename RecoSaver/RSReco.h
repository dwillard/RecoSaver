//
//  RSReco.h
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface RSReco : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *recoDescription;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *recommendedBy;
@property (nonatomic, weak) PFUser *user;

@end
