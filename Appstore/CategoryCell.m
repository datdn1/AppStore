//
//  CategoryCell.m
//  Appstore
//
//  Created by Doan Dat on 10/1/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "CategoryCell.h"
#import "Masonry.h"
#import "AppCell.h"

#define kAppCellIdentifier      @"AppCellId"

@interface CategoryCell ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *appcollectionView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *dividerLineView;
@property (nonatomic, strong) UILabel *seeAllLabel;

@end

@implementation CategoryCell

- (UICollectionView*)appcollectionView {
    if (!_appcollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 8, 0, 8);
        _appcollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _appcollectionView.translatesAutoresizingMaskIntoConstraints = false;
        _appcollectionView.backgroundColor = [UIColor whiteColor];
        [_appcollectionView registerClass:[AppCell class] forCellWithReuseIdentifier:kAppCellIdentifier];
        _appcollectionView.delegate = self;
        _appcollectionView.dataSource = self;
    }
    return _appcollectionView;
}

- (UILabel*)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.text = @"Best New Apps";
        _nameLabel.backgroundColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.numberOfLines = 1;
        _nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    }
    return _nameLabel;
}

- (UILabel*)seeAllLabel {
    if (!_seeAllLabel) {
        _seeAllLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _seeAllLabel.text = @"See all>";
        _seeAllLabel.backgroundColor = [UIColor whiteColor];
        _seeAllLabel.font = [UIFont systemFontOfSize:13];
        _seeAllLabel.numberOfLines = 1;
        _seeAllLabel.textColor = [UIColor darkGrayColor];
        _seeAllLabel.translatesAutoresizingMaskIntoConstraints = false;
    }
    return _seeAllLabel;
}

- (UIView*)dividerLineView {
    if (!_dividerLineView) {
        _dividerLineView = [[UIView alloc] initWithFrame:CGRectZero];
        _dividerLineView.translatesAutoresizingMaskIntoConstraints = false;
        _dividerLineView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.4];
    }
    return _dividerLineView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setAppCategory:(AppCategory *)appCategory {
    _appCategory = appCategory;
    self.nameLabel.text = appCategory.name;
    [self.appcollectionView reloadData];
}

- (void)setupViews {
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.appcollectionView];
    [self addSubview:self.dividerLineView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.seeAllLabel];
    
    // add constraints
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.right.equalTo(self).insets(UIEdgeInsetsMake(0, 8, 0, 8));
        make.bottom.equalTo(self.appcollectionView.mas_top);
        make.height.equalTo(@30);
    }];
    
    [self.seeAllLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.right.equalTo(self).offset(-8);
    }];
    
    [self.appcollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self);
        make.bottom.equalTo(self.dividerLineView.mas_top);
    }];
    
    [self.dividerLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(self).insets(UIEdgeInsetsMake(0, 8, 0, 8));
        make.height.equalTo(@1);
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.appCategory.apps count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AppCell *appCell = [collectionView dequeueReusableCellWithReuseIdentifier:kAppCellIdentifier forIndexPath:indexPath];
    appCell.app = self.appCategory.apps[indexPath.item];
    appCell.backgroundColor = [UIColor whiteColor];
    return appCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, self.bounds.size.height - 30 - 1);
}
@end
