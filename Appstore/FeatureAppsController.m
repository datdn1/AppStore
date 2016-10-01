//
//  ViewController.m
//  Appstore
//
//  Created by Doan Dat on 10/1/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "FeatureAppsController.h"
#import "CategoryCell.h"

#define kCategoryCellIdentifier     @"CategoryCellId"
#define kCategoryCellNibName        @"CategoryCell"

@interface FeatureAppsController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation FeatureAppsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Feature";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[CategoryCell class] forCellWithReuseIdentifier:kCategoryCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *categoryCell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategoryCellIdentifier forIndexPath:indexPath];
    return categoryCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.bounds.size.width, 230);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
