//
//  RSRecoDataController.h
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSReco;

@interface RSRecoDataController : NSObject

@property (nonatomic, copy) NSMutableArray *recoArray;

- (NSUInteger) numRecos;
- (RSReco *) objectInRecoArrayAtIndex:(NSUInteger)index;
- (void) addRecoArrayObject:(RSReco *)reco;
- (void) removeRecoFromArray:(RSReco *)recoToDelete;

@end
