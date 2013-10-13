//
//  RSReco.m
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import "RSReco.h"

@implementation RSReco

- (id)initWithName:(NSString *)name description:(NSString *)description location:(NSString *)location recommendedBy:(NSString *)recommendedBy {
    self = [super init];
    if (self) {
        _name = name;
        _description = description;
        _location = location;
        _recommendedBy = recommendedBy;
        return self;
    }
    return nil;
}

@end
