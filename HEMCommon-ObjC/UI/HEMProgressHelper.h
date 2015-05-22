//
//  HEMProgressHelper.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 5/21/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HEMProgressHelper : NSObject

#pragma mark - Options

/**
 *  CGFloat value used to change the progress line width.
 */
FOUNDATION_EXPORT NSString * const HEMPHHUDLineWidth;

/**
 *  CGSize value used to change the size of the progress.
 */
FOUNDATION_EXPORT NSString * const HEMPHHUDProgressSize;

/**
 *  UIColor value used to change the progress line color.
 */
FOUNDATION_EXPORT NSString * const HEMPHHUDProgressTintColor;

/**
 *  UIColor value used to change the color of the navigation bar progress.
 */
FOUNDATION_EXPORT NSString * const HEMPHNavigationBarProgressTintColor;

/**
 *  Defines an dictionary with the configuration for the progress displayed in the screen.
 *
 *  @param configuration Dictionary with the appearance configuration of the progress.
 */
+ (void)setConfiguration:(NSDictionary *)configuration;

#pragma mark - HUD

/**
 *  Displays a indeterminate progress HUD in root view controller.
 */
+ (void)showLoadingView;

/**
 *  Displays a indeterminate progress HUD in given view.
 *
 *  @param view view to display the HUD.
 */
+ (void)showLoadingViewInView:(UIView *)view;

/**
 *  Displays a indeterminate progress HUD in root view controller with a title.
 *
 *  @param title title of the HUD.
 */
+ (void)showLoadingViewWithTitle:(NSString *)title;

/**
 *  Displays a indeterminate progress HUD in root view controller with a custom background color.
 *
 *  @param color custom background color of the overlay view.
 */
+ (void)showLoadingViewWithBackgroundColor:(UIColor *)color;

/**
 *  Displays a indeterminate progress HUD in root view controller with a custom background color.
 *
 *  @param color      custom background color of the overlay view.
 *  @param blockingUI boolean that indicates if the user interface will be blocked when HUD is displayed.
 */
+ (void)showLoadingViewWithBackgroundColor:(UIColor *)color
                                blockingUI:(BOOL)blockingUI;

/**
 *  Displays a indeterminate progress HUD in root view controller with a title with a title message.
 *
 *  @param title title of the HUD.
 *  @param view  view to display the HUD.
 */
+ (void)showLoadingViewWithTitle:(NSString *)title
                          inView:(UIView *)view;

/**
 *  Displays a indeterminate progress HUD in root view controller with a custom background color.
 *
 *  @param title title of the HUD.
 *  @param color custom background color of the overlay view.
 */
+ (void)showLoadingViewWithTitle:(NSString *)title
                 backgroundColor:(UIColor *)color;

/**
 *  Displays a indeterminate progress HUD in root view controller.
 *
 *  @param title      title of the HUD.
 *  @param color      custom background color of the overlay view.
 *  @param blockingUI boolean that indicates if the user interface will be blocked when HUD is displayed.
 */
+ (void)showLoadingViewWithTitle:(NSString *)title
                 backgroundColor:(UIColor *)color
                      blockingUI:(BOOL)blockingUI;

/**
 *  Displays a indeterminate progress HUD in given view.
 *
 *  @param title      title of the HUD.
 *  @param color      custom background color of the overlay view.
 *  @param view       view to display the HUD.
 *  @param blockingUI boolean that indicates if the user interface will be blocked when HUD is displayed.
 */
+ (void)showLoadingViewWithTitle:(NSString *)title
                 backgroundColor:(UIColor *)color
                          inView:(UIView *)view
                      blockingUI:(BOOL)blockingUI;

/**
 *  Dismiss the HUD of the screen.
 */
+ (void)dismissLoadingView;

#pragma mark - Navigation Bar Progress

/**
 *  Displays an progress below of a given navigation bar.
 *
 *  @param navigationBar given navigation bar.
 */
+ (void)showIndeterminateProgressInNavigationBar:(UINavigationBar *)navigationBar;

/**
 *  Dismiss the progress below the navigation bar.
 */
+ (void)dismissIndeterminateProgress;

@end
