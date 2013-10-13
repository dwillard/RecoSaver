//
//  RSRecoDataController.m
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import "RSRecoDataController.h"
#import "RSReco.h"

@interface RSRecoDataController ()
- (void) initDefaultRecoArray;
@end

@implementation RSRecoDataController

- (id) init {
    
    self = [super init];
    if (self) {
        [self initDefaultRecoArray];
        return self;
    }
    return nil;
}

- (void) initDefaultRecoArray {
    _recoArray = [NSMutableArray new];
    RSReco *reco = [[RSReco alloc] initWithName:@"Barrones" description:@"Nice little café with outdoorsy seating" location:@"Menlo Park, CA" recommendedBy:@"Bebu"];
    [self addRecoArrayObject:reco];
}

- (void) setRecoArray:(NSMutableArray *)recoArray {
    
    if (_recoArray != recoArray) {
        _recoArray = [recoArray mutableCopy];
    }
}

- (NSUInteger) numRecos {
    return _recoArray.count;
}

- (RSReco *) objectInRecoArrayAtIndex:(NSUInteger)index {
    return [_recoArray objectAtIndex:index];
}

- (void) addRecoArrayObject:(RSReco *)reco {
    [_recoArray addObject:reco];
}


@end
