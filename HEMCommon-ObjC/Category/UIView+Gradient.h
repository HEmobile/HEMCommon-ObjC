//
//  UIView+Gradient.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 2/26/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gradient)

- (void)hem_setGradientBackgroundWithColors:(NSArray *)colors;
- (void)hem_setGradientBackgroundWithColors:(NSArray *)colors vertical:(BOOL)isVertical;
- (void)hem_setGradientBackgroundWithColors:(NSArray *)colors vertical:(BOOL)isVertical opacity:(float)opacity;

@end
