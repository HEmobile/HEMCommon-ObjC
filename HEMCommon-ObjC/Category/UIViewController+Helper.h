//
//  UIViewController+Helper.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 5/20/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Helper)

/**
 *  Check if a UIVIewController instance is presented as modal or not.
 *
 *  @return boolean indicating if the UIViewController is a modal or not.
 */
- (BOOL)hem_isModal;

@end
