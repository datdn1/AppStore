//
//  AppCell.m
//  Appstore
//
//  Created by Doan Dat on 10/1/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "AppCell.h"

@interface AppCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *categoryLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@end

@implementation AppCell

- (UIImageView*)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.image = [UIImage imageNamed:@"frozen"];
        _imageView.layer.cornerRadius = 16;
        _imageView.layer.masksToBounds = true;
    }
    return _imageView;
}

- (UILabel*)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"Disney Build It: Frozen";
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.numberOfLines = 2;
    }
    return _nameLabel;
}

- (UILabel*)categoryLabel {
    if (!_categoryLabel) {
        _categoryLabel = [[UILabel alloc] init];
        _categoryLabel.text = @"Entertaiment";
        _categoryLabel.font = [UIFont systemFontOfSize:13];
        _categoryLabel.numberOfLines = 1;
        _categoryLabel.textColor = [UIColor darkGrayColor];
    }
    return _categoryLabel;
}

- (UILabel*)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.text = @"$3.99";
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.numberOfLines = 1;
        _priceLabel.textColor = [UIColor darkGrayColor];
    }
    return _priceLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);
    self.nameLabel.frame = CGRectMake(0, self.bounds.size.width + 2, self.bounds.size.width, 40);
    self.categoryLabel.frame = CGRectMake(0, self.bounds.size.width + 38, self.bounds.size.width, 20);
    self.priceLabel.frame = CGRectMake(0, self.bounds.size.width + 56, self.bounds.size.width, 20);
}

- (void)setupViews {
    [self addSubview:self.imageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.categoryLabel];
    [self addSubview:self.priceLabel];
}

@end
