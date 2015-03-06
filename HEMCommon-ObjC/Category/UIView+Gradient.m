//
//  UIView+Gradient.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 2/26/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "UIView+Gradient.h"

@implementation UIView (Gradient)

- (void)hem_setGradientBackgroundWithColors:(NSArray *)colors
{
    [self hem_setGradientBackgroundWithColors:colors vertical:YES opacity:1.0f];
}

- (void)hem_setGradientBackgroundWithColors:(NSArray *)colors vertical:(BOOL)isVertical
{
    [self hem_setGradientBackgroundWithColors:colors vertical:isVertical opacity:1.0f];
}

- (void)hem_setGradientBackgroundWithColors:(NSArray *)colors vertical:(BOOL)isVertical opacity:(float)opacity
{
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.colors = colors;
    gradientLayer.opacity = opacity;
    gradientLayer.frame = self.bounds;
    
    if (!isVertical) {
        gradientLayer.startPoint = CGPointMake(0.0, 0.5);
        gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    }
    
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end
