//
//  AppDetailController.m
//  Appstore
//
//  Created by Doan Dat on 10/2/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "AppDetailController.h"
#import "AppDetailHeader.h"
#import "ScreenshotCell.h"

#define kAppDetailHeaderCellIdentifier @"AppDetailHeaderId"
#define kScreenshotCellIdentifier      @"ScreenshotCellId"

@interface AppDetailController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation AppDetailController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[AppDetailHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kAppDetailHeaderCellIdentifier];
    [self.collectionView registerClass:[ScreenshotCell class] forCellWithReuseIdentifier:kScreenshotCellIdentifier];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ScreenshotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kScreenshotCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == 0) {
        return CGSizeMake(self.view.bounds.size.width, 160);
    }
    return CGSizeZero;
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    AppDetailHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kAppDetailHeaderCellIdentifier forIndexPath:indexPath];
    header.app = self.app;
    return header;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.bounds.size.width, 160);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
