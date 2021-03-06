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
@end

@implementation RSRecoDataController

- (id) init {
    
    self = [super init];
    if (self) {
        _recoArray = [NSMutableArray new];
        return self;
    }
    return nil;
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

- (void) removeRecoFromArray:(RSReco *)recoToDelete {
    NSString *recoToDeleteID = recoToDelete.objectId;
    for (int i = 0; i < _recoArray.count; i++) {
        RSReco *reco = [_recoArray objectAtIndex:i];
        if ([reco.objectId isEqualToString:recoToDeleteID]) {
            [recoToDelete deleteInBackground];
            [_recoArray removeObjectAtIndex:i];
            break;
        }
    }
}
@end
