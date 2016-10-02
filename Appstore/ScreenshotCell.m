//
//  ScreenshotCell.m
//  Appstore
//
//  Created by Doan Dat on 10/2/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "ScreenshotCell.h"
#import "ScreenshotImageCell.h"
#import "Masonry.h"

#define kScreenshotImageCellIdentifier      @"ScreenshotImageCellId"

@interface ScreenshotCell ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end


@implementation ScreenshotCell

- (UICollectionView*)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.translatesAutoresizingMaskIntoConstraints = false;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
- (void)setupViews {
    [self.collectionView registerClass:[ScreenshotImageCell class] forCellWithReuseIdentifier:kScreenshotImageCellIdentifier];
    [self addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ScreenshotImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kScreenshotImageCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(200, self.bounds.size.height - 32);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(16, 8, 16, 8);
}



@end
