//
//  AppDetailCell.m
//  Appstore
//
//  Created by Doan Dat on 10/2/16.
//  Copyright (c) 2016 Doan Dat. All rights reserved.
//

#import "AppDetailHeader.h"
#import "Masonry.h"
#import "App.h"

@interface AppDetailHeader ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *categoryLabel;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *plusLabel;
@property (nonatomic, strong) UIView *dividerView;

@end

@implementation AppDetailHeader

- (UIImageView*)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.translatesAutoresizingMaskIntoConstraints = false;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.layer.cornerRadius = 16;
        _imageView.layer.masksToBounds = true;
    }
    return _imageView;
}

- (UILabel*)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.numberOfLines = 2;
        _nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    }
    return _nameLabel;
}

- (UILabel*)categoryLabel {
    if (!_categoryLabel) {
        _categoryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _categoryLabel.font = [UIFont systemFontOfSize:14];
        _categoryLabel.numberOfLines = 1;
        _categoryLabel.textColor = [UIColor darkGrayColor];
        _categoryLabel.translatesAutoresizingMaskIntoConstraints = false;
    }
    return _categoryLabel;
}

- (UIButton*)button {
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectZero];
        _button.translatesAutoresizingMaskIntoConstraints = false;
        _button.layer.cornerRadius = 5;
        _button.layer.masksToBounds = true;
        _button.layer.borderColor = [UIColor colorWithRed:0 green:129/255.0 blue:250/255.0 alpha:1].CGColor;
        _button.layer.borderWidth = 1;
        [_button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_button sizeToFit];
        [_button setTintColor:[UIColor colorWithRed:0 green:129/255.0 blue:250/255.0 alpha:1]];
        [_button setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
        [_button setTitleColor:[UIColor colorWithRed:0 green:129/255.0 blue:250/255.0 alpha:1] forState:UIControlStateNormal];
    }
    return _button;
}

- (UILabel*)plusLabel {
    if (!_plusLabel) {
        _plusLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _plusLabel.font = [UIFont systemFontOfSize:14];
        _plusLabel.numberOfLines = 1;
        _plusLabel.textColor = [UIColor colorWithRed:0 green:129/255.0 blue:250/255.0 alpha:1];
        _plusLabel.text = @"+";
        _plusLabel.translatesAutoresizingMaskIntoConstraints = false;
    }
    return _plusLabel;
}

- (UISegmentedControl*)segmentControl {
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"Details", @"Reviews", @"Related"]];
        _segmentControl.translatesAutoresizingMaskIntoConstraints = false;
        _segmentControl.tintColor = [UIColor lightGrayColor];
        _segmentControl.selectedSegmentIndex = 0;
        
    }
    return _segmentControl;
}

- (UIView*)dividerView {
    if (!_dividerView) {
        _dividerView = [[UIView alloc] initWithFrame:CGRectZero];
        _dividerView.translatesAutoresizingMaskIntoConstraints = false;
        _dividerView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.4];
    }
    return _dividerView;
}

- (void)setApp:(App *)app {
    self.imageView.image = [UIImage imageNamed:app.imageName];
    self.nameLabel.text = app.name;
    self.categoryLabel.text = app.category;
    
    if (app.price != nil) {
        [self.button setTitle:[NSString stringWithFormat:@"USD %@", [app.price stringValue]] forState:UIControlStateNormal];
    }
    else {
        [self.button setTitle:@"GET" forState:UIControlStateNormal];
    }
}

- (void)setupViews {
    [self addSubview:self.imageView];
    [self addSubview:self.segmentControl];
    [self addSubview:self.nameLabel];
    [self addSubview:self.categoryLabel];
    [self addSubview:self.button];
    [self addSubview:self.dividerView];
    [self.button addSubview:self.plusLabel];
    
    // add constraints
    UIEdgeInsets padding = UIEdgeInsetsMake(14, 14, 5, 14);
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self).insets(padding);
        make.height.and.width.equalTo(@100);
    }];
    
    [self.segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self).insets(padding);
        make.bottom.equalTo(self.dividerView.mas_top).offset(-8);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView);
        make.left.equalTo(self.imageView.mas_right).offset(14);
        make.right.equalTo(self).offset(-14);
    }];
    
    [self.categoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(2);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imageView);
        make.right.equalTo(self).offset(-14);
        make.height.equalTo(@25);
    }];
    
    [self.plusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(self.button).insets(UIEdgeInsetsMake(-2, 0, 0, 0));
    }];
    
    [self.dividerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(self);
        make.height.equalTo(@1);
    }];
}
@end
