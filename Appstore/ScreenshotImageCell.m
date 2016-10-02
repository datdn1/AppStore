//
//  ScreenshotImageCell.m
//  Appstore
//
//  Created by Doan Dat on 10/3/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "ScreenshotImageCell.h"

@interface ScreenshotImageCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ScreenshotImageCell

- (UIImageView*)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor yellowColor];
        _imageView.translatesAutoresizingMaskIntoConstraints = false;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (void)setupViews {
    [self addSubview:self.imageView];
}

- (void)layoutSubviews {
    self.imageView.frame = self.bounds;
}

@end
