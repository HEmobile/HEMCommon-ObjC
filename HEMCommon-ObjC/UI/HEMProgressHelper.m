//
//  HEMProgressHelper.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 5/21/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <MRProgress/MRProgress.h>
#import <GSIndeterminateProgressBar/GSIndeterminateProgressView.h>
#import <CRToast/CRToast.h>
#import <MMMaterialDesignSpinner/MMMaterialDesignSpinner.h>

#import "HEMProgressHelper.h"

@interface HEMProgressHelper ()

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) GSIndeterminateProgressView *progressView;

@property (nonatomic) NSInteger numberOfAlerts;
@property (nonatomic, getter=isShowingProgress) BOOL showingProgress;
@property (nonatomic, getter=isShowingConnectionUnavailable) BOOL showingConnectionUnavailable;

@end

@implementation HEMProgressHelper

#pragma mark - Singleton

+ (HEMProgressHelper *)sharedInstance
{
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    
    return instance;
}

#pragma mark - Helper

+ (UIView *)topView
{
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    UIViewController *rootViewController = mainWindow.rootViewController;
    UIView *mainView = rootViewController.presentedViewController ? rootViewController.presentedViewController.view : rootViewController.view;
    
    return mainView;
}

#pragma mark - MRProgress

+ (void)showLoadingView
{
    [self showLoadingViewWithTitle:@""];
}

+ (void)showLoadingViewWithTitle:(NSString *)title
{
    UIView *topView = [self topView];
    [self showLoadingViewWithTitle:title inView:topView];
}

+ (void)showLoadingViewWithTitle:(NSString *)title
                          inView:(UIView *)view
{
    [self showLoadingViewWithTitle:title
                   backgroundColor:nil
                            inView:view
                        blockingUI:YES];
}

+ (void)showLoadingViewInView:(UIView *)view
{
    [self showLoadingViewWithTitle:@""
                   backgroundColor:nil
                            inView:view
                        blockingUI:YES];
}

+ (void)showLoadingViewWithBackgroundColor:(UIColor *)color
{
    [self showLoadingViewWithTitle:@""
                   backgroundColor:color];
}

+ (void)showLoadingViewWithTitle:(NSString *)title
                 backgroundColor:(UIColor *)color
{
    [self showLoadingViewWithTitle:title
                   backgroundColor:color
                        blockingUI:YES];
}

+ (void)showLoadingViewWithBackgroundColor:(UIColor *)color
                                blockingUI:(BOOL)blockingUI
{
    [self showLoadingViewWithTitle:@""
                   backgroundColor:color
                        blockingUI:blockingUI];
}

+ (void)showLoadingViewWithTitle:(NSString *)title
                 backgroundColor:(UIColor *)color
                      blockingUI:(BOOL)blockingUI
{
    [self showLoadingViewWithTitle:title
                   backgroundColor:color
                            inView:[self topView]
                        blockingUI:blockingUI];
}

+ (void)showLoadingViewWithTitle:(NSString *)title
                 backgroundColor:(UIColor *)color
                          inView:(UIView *)view
                      blockingUI:(BOOL)blockingUI
{
    if (![self sharedInstance].isShowingProgress) {
        [self sharedInstance].topView = view;
        
        MRProgressOverlayView *overlayView = [MRProgressOverlayView showOverlayAddedTo:view
                                                                                 title:title
                                                                                  mode:MRProgressOverlayViewModeCustom
                                                                              animated:YES];
        
        overlayView.userInteractionEnabled = blockingUI;
        
        // custom spinner
        MMMaterialDesignSpinner *spinner = [[MMMaterialDesignSpinner alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
        spinner.lineWidth = 2.0f;
        [spinner startAnimating];
        
        overlayView.modeView = spinner;
        
        if (color) {
            overlayView.backgroundColor = color;
        }
        
        [self sharedInstance].numberOfAlerts = 1;
        [self sharedInstance].showingProgress = YES;
    }
    else {
        [self sharedInstance].numberOfAlerts++;
    }
}

+ (void)dismissLoadingView
{
    [self sharedInstance].numberOfAlerts--;
    
    if ([self sharedInstance].numberOfAlerts == 0) {
        [self sharedInstance].showingProgress = NO;
        [MRProgressOverlayView dismissOverlayForView:[self sharedInstance].topView
                                            animated:YES];
    }
}

#pragma mark - GSIndeterminateProgressView

+ (void)showIndeterminateProgressInNavigationBar:(UINavigationBar *)navigationBar
{
    if (![self sharedInstance].progressView) {
        [self sharedInstance].progressView = [[GSIndeterminateProgressView alloc] initWithFrame:CGRectMake(0, navigationBar.frame.size.height, navigationBar.frame.size.width, 3)];
        [self sharedInstance].progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [self sharedInstance].progressView.hidesWhenStopped = YES;
        [navigationBar addSubview:[self sharedInstance].progressView];
    }
    
    [[self sharedInstance].progressView startAnimating];}

+ (void)dismissIndeterminateProgress
{
    [[self sharedInstance].progressView stopAnimating];
}

@end
