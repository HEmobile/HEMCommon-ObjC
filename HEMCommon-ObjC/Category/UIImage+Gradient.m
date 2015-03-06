//
//  UIImage+Gradient.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 3/5/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "UIImage+Gradient.h"

@implementation UIImage (Gradient)

+ (UIImage *)hem_gradientImageFromColors:(NSArray *)colors vertical:(BOOL)isVertical opacity:(float)opacity frame:(CGRect)frame
{
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.colors = colors;
    gradientLayer.opacity = opacity;
    gradientLayer.frame = frame;
    
    if (!isVertical) {
        gradientLayer.startPoint = CGPointMake(0.0, 0.5);
        gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    }
    
    UIGraphicsBeginImageContext([gradientLayer frame].size);
    
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return outputImage;
}

@end
