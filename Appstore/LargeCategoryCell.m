//
//  LargeCategoryCell.m
//  Appstore
//
//  Created by Doan Dat on 10/2/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "LargeCategoryCell.h"
#import "LargeAppCell.h"

#define kLargeAppCellIdentifier @"LargeAppCellId"

@implementation LargeCategoryCell

- (void)setupViews {
    [super setupViews];
    [self.appcollectionView registerClass:[LargeAppCell class] forCellWithReuseIdentifier:kLargeAppCellIdentifier];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LargeAppCell *largeAppCell = [collectionView dequeueReusableCellWithReuseIdentifier:kLargeAppCellIdentifier forIndexPath:indexPath];
    largeAppCell.app = self.appCategory.apps[indexPath.item];
    largeAppCell.backgroundColor = [UIColor whiteColor];
    return largeAppCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(200, self.bounds.size.height - 30 - 1);
}

@end
