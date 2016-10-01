//
//  AppCategory.h
//  Appstore
//
//  Created by Doan Dat on 10/1/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppCategory : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *apps;
@property (nonatomic, copy) NSString *type;

+ (void)fetchAppsFromURL:(NSString*)urlString completion:(void (^)(NSArray *apps, NSError *error))completion;
@end
