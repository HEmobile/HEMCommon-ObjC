//
//  UIViewController+Helper.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 5/20/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "UIViewController+Helper.h"

@implementation UIViewController (Helper)

- (BOOL)hem_isModal
{
    return self.presentingViewController.presentedViewController == self || (self.navigationController != nil && self.navigationController.presentingViewController.presentedViewController == self.navigationController) || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

@end
