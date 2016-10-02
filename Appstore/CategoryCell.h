//
//  CategoryCell.h
//  Appstore
//
//  Created by Doan Dat on 10/1/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppCategory.h"

@class FeatureAppsController;
@interface CategoryCell : UICollectionViewCell

@property (nonatomic, strong)  AppCategory *appCategory;
@property (nonatomic, strong) UICollectionView *appcollectionView;
@property (nonatomic, strong) FeatureAppsController *controller;

- (void)setupViews;
@end
