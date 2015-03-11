//
//  HEMRoundedImageView.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 3/11/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMRoundedImageView.h"

@implementation HEMRoundedImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    self.radius = 0.0;
}

- (CGFloat)radius
{
    return self.layer.cornerRadius;
}

- (void)setRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    [self setNeedsLayout];
}

@end
