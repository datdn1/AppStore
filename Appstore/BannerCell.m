//
//  BannerCell.m
//  Appstore
//
//  Created by Doan Dat on 10/2/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "BannerCell.h"

@implementation BannerCell

- (void)setupViews {
    self.imageView.layer.cornerRadius = 0;
    [self addSubview:self.imageView];
}

- (void)layoutSubviews {
    self.imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

@end
