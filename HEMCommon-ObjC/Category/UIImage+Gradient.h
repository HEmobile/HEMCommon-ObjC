//
//  UIImage+Gradient.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 3/5/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Gradient)

/**
 *  Generates an UIImage instance with a gradient background.
 *
 *  @param colors     Array of colors used to make the gradient effect. (Left->Right, Top->Bottom)
 *  @param isVertical Boolean indicating if the gradient will be vertical or horizontal.
 *  @param opacity    Opacity value.
 *  @param frame      Image frame.
 *
 *  @return UIImage instance.
 */
+ (UIImage *)hem_gradientImageFromColors:(NSArray *)colors
                                vertical:(BOOL)isVertical
                                 opacity:(float)opacity
                                   frame:(CGRect)frame;

@end
