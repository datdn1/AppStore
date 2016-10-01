//
//  AppCategory.m
//  Appstore
//
//  Created by Doan Dat on 10/1/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "AppCategory.h"
#import "App.h"

@implementation AppCategory

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"apps"]) {
        NSMutableArray *apps = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in value) {
            App *app = [[App alloc] init];
            [app setValuesForKeysWithDictionary:dict];
            [apps addObject:app];
        }
        self.apps = [apps copy];
    }
    else {
        [super setValue:value forKey:key];
    }
}

+ (void)fetchAppsFromURL:(NSString*)urlString completion:(void (^)(NSArray *apps, NSError *error))completion {
    NSURL *url = [NSURL URLWithString:urlString];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
        
        if (json) {
            NSMutableArray *appsCategory = [[NSMutableArray alloc] init];
            NSArray *categories = [json valueForKey:@"categories"];
            for (NSDictionary *dict in categories) {
                AppCategory *appCategory = [[AppCategory alloc] init];
                [appCategory setValuesForKeysWithDictionary:dict];
                [appsCategory addObject:appCategory];
            }
            completion([appsCategory copy], nil);
            return;
        }
        completion(nil, jsonError);
    }] resume];
}

@end
