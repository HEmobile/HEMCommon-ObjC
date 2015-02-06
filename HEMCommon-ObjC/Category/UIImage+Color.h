//
//  UIImage+Color.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 1/26/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
 *  Returns an UIImage instance with a given color.
 *
 *  @param color given color used to fill the UIImage instance.
 *
 *  @return UIImage instance with a given color.
 */
+ (UIImage *)hem_imageWithColor:(UIColor *)color;

@end
