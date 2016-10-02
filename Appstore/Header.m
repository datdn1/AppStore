//
//  Header.m
//  Appstore
//
//  Created by Doan Dat on 10/2/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "Header.h"
#import "BannerCell.h"

#define kBannerCellIdentifier @"BannerCellId"

@implementation Header

- (void)setupViews {
    [self.appcollectionView registerClass:[BannerCell class] forCellWithReuseIdentifier:kBannerCellIdentifier];
    [self addSubview:self.appcollectionView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.appcollectionView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BannerCell *bannerCell = [collectionView dequeueReusableCellWithReuseIdentifier:kBannerCellIdentifier forIndexPath:indexPath];
    bannerCell.app = self.appCategory.apps[indexPath.item];
    return bannerCell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.bounds.size.width / 2 + 50, self.bounds.size.height);
}

@end
