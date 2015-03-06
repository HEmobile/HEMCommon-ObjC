//
//  UIImage+Gradient.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 3/5/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Gradient)

+ (UIImage *)hem_gradientImageFromColors:(NSArray *)colors vertical:(BOOL)isVertical opacity:(float)opacity frame:(CGRect)frame;

@end
