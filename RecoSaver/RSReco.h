//
//  RSReco.h
//  RecoSaver
//
//  Created by Diana on 10/12/13.
//  Copyright (c) 2013 Red String Collaborative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSReco : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *recommendedBy;

- (id)initWithName:(NSString *)name description:(NSString *)description location:(NSString *)location recommendedBy:(NSString *)recommendedBy;

@end
