//
//  UIView+Gradient.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 2/26/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gradient)

/**
 *  Define the background of an UIView using a gradient effect.
 *
 *  @param colors Array of colors used to make the gradient effect. (Left->Right, Top->Bottom)
 */
- (void)hem_setGradientBackgroundWithColors:(NSArray *)colors;

/**
 *  Define the background of an UIView using a gradient effect.
 *
 *  @param colors     Array of colors used to make the gradient effect. (Left->Right, Top->Bottom)
 *  @param isVertical Boolean indicating if the gradient will be vertical or horizontal.
 */
- (void)hem_setGradientBackgroundWithColors:(NSArray *)colors
                                   vertical:(BOOL)isVertical;


/**
 *  Define the background of an UIView using a gradient effect.
 *
 *  @param colors     Array of colors used to make the gradient effect. (Left->Right, Top->Bottom)
 *  @param isVertical Boolean indicating if the gradient will be vertical or horizontal.
 *  @param opacity    Opacity value.
 */
- (void)hem_setGradientBackgroundWithColors:(NSArray *)colors
                                   vertical:(BOOL)isVertical
                                    opacity:(float)opacity;

@end
