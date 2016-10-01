//
//  ViewController.m
//  Appstore
//
//  Created by Doan Dat on 10/1/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "FeatureAppsController.h"
#import "CategoryCell.h"
#import "AppCategory.h"


#define kCategoryCellIdentifier     @"CategoryCellId"
#define kCategoryCellNibName        @"CategoryCell"

@interface FeatureAppsController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *appsCategory;

@end

@implementation FeatureAppsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Feature";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[CategoryCell class] forCellWithReuseIdentifier:kCategoryCellIdentifier];
    
    // fetch data
    [AppCategory fetchAppsFromURL:@"http://www.statsallday.com/appstore/featured" completion:^(NSArray *apps, NSError *error) {
        if (!error) {
            self.appsCategory = apps;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.appsCategory count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *categoryCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategoryCellIdentifier forIndexPath:indexPath];
    categoryCell.appCategory = self.appsCategory[indexPath.item];
    return categoryCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.bounds.size.width, 230);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
