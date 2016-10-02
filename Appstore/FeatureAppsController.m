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
#import "LargeCategoryCell.h"
#import "Header.h"
#import "AppDetailController.h"

#define kCategoryCellIdentifier     @"CategoryCellId"
#define kCategoryCellNibName        @"CategoryCell"
#define kLargeCellIdentifier        @"LargeCellId"
#define kHeaderCellIdentifier       @"HeaderCellId"

@interface FeatureAppsController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *appsCategory;
@property (nonatomic, strong) AppCategory *bannerCategory;

@end

@implementation FeatureAppsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Feature";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[CategoryCell class] forCellWithReuseIdentifier:kCategoryCellIdentifier];
    [self.collectionView registerClass:[LargeCategoryCell class] forCellWithReuseIdentifier:kLargeCellIdentifier];
    [self.collectionView registerClass:[Header class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderCellIdentifier];
    
    // fetch data
    [AppCategory fetchAppsFromURL:@"http://www.statsallday.com/appstore/featured" completion:^(FeatureApps *featureApps, NSError *error) {
        if (!error) {
            self.appsCategory = featureApps.categories;
            self.bannerCategory = featureApps.bannerCategory;
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
    CategoryCell *cell = nil;
    if (indexPath.item == 2) {
        LargeCategoryCell *largeCell = [collectionView dequeueReusableCellWithReuseIdentifier:kLargeCellIdentifier forIndexPath:indexPath];
        cell = largeCell;
    }
    else {
        CategoryCell *categoryCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategoryCellIdentifier forIndexPath:indexPath];
        cell = categoryCell;
    }
    cell.appCategory = self.appsCategory[indexPath.item];
    cell.controller = self;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == 2) {
        return CGSizeMake(self.view.bounds.size.width, 160);
    }
    return CGSizeMake(self.view.bounds.size.width, 230);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.bounds.size.width, 120);
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    Header *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderCellIdentifier forIndexPath:indexPath];
    header.appCategory = self.bannerCategory;
    return header;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected");
}

- (void)showDetailForApp:(App*)app {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    AppDetailController *detail = [[AppDetailController alloc] initWithCollectionViewLayout:layout];
    detail.app = app;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
