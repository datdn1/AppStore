//
//  LargeAppCell.m
//  Appstore
//
//  Created by Doan Dat on 10/2/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "LargeAppCell.h"

@implementation LargeAppCell

- (void)setupViews {
    [self addSubview:self.imageView];
}

- (void)layoutSubviews {
    self.imageView.frame = CGRectMake(0, 2, self.bounds.size.width, self.bounds.size.height - 14);
}

@end
