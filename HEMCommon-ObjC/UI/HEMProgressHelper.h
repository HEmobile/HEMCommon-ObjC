//
//  HEMProgressHelper.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 5/21/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HEMProgressHelper : UIView

#pragma mark - 

+ (void)showLoadingView;

+ (void)showLoadingViewInView:(UIView *)view;

+ (void)showLoadingViewWithTitle:(NSString *)title;

+ (void)showLoadingViewWithBackgroundColor:(UIColor *)color;

+ (void)showLoadingViewWithBackgroundColor:(UIColor *)color
                                blockingUI:(BOOL)blockingUI;

+ (void)showLoadingViewWithTitle:(NSString *)title
                          inView:(UIView *)view;

+ (void)showLoadingViewWithTitle:(NSString *)title
                 backgroundColor:(UIColor *)color;

+ (void)showLoadingViewWithTitle:(NSString *)title
                 backgroundColor:(UIColor *)color
                      blockingUI:(BOOL)blockingUI;

+ (void)showLoadingViewWithTitle:(NSString *)title
                 backgroundColor:(UIColor *)color
                          inView:(UIView *)view
                      blockingUI:(BOOL)blockingUI;

+ (void)dismissLoadingView;

#pragma mark -

+ (void)showIndeterminateProgressInNavigationBar:(UINavigationBar *)navigationBar;

+ (void)dismissIndeterminateProgress;

@end
