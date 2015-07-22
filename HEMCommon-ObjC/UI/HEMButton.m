//
//  HEMButton.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 7/22/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMButton.h"

@interface HEMButton ()

@property (nonatomic, strong) UIColor *unselectedBackgroundColor;

@end

@implementation HEMButton

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
    self.cornerRadius = 0.0f;
    self.borderColor  = [UIColor clearColor];
    self.borderWidth  = 0.0f;
    
    self.layer.masksToBounds = YES;
    
    self.selectedBackgroundColor = [UIColor clearColor];
    if (!self.unselectedBackgroundColor) {
        self.unselectedBackgroundColor = self.backgroundColor;
    }
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        self.backgroundColor = self.selectedBackgroundColor;
    }
    else {
        self.backgroundColor = self.unselectedBackgroundColor;
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = self.selectedBackgroundColor;
    }
    else {
        self.backgroundColor = self.unselectedBackgroundColor;
    }
}

@end
