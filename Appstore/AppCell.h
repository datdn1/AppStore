//
//  AppCell.h
//  Appstore
//
//  Created by Doan Dat on 10/1/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "App.h"

@interface AppCell : UICollectionViewCell

@property (nonatomic, strong) App *app;
@property (nonatomic, strong) UIImageView *imageView;

@end
