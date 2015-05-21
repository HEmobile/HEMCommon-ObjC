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

#pragma mark - Options

NSString * const HEMPHHUDLineWidth                      = @"kProgressLineWidth";
NSString * const HEMPHHUDProgressSize                   = @"kProgressSize";
NSString * const HEMPHHUDProgressTintColor              = @"kProgressTintColor";
NSString * const HEMPHNavigationBarProgressTintColor    = @"kNavigationBarProgressTintColor";

@interface HEMProgressHelper ()

@property (nonatomic, strong) NSDictionary *configuration;

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

+ (MMMaterialDesignSpinner *)createSpinner
{
    NSDictionary *configuration = [self sharedInstance].configuration;
    
    MMMaterialDesignSpinner *spinner = [[MMMaterialDesignSpinner alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    if (configuration) {
        UIColor *color = configuration[HEMPHHUDProgressTintColor];
        BOOL optionIsValid = color && [color isKindOfClass:[UIColor class]];
        if (optionIsValid) {
            spinner.tintColor = color;
        }
        
        CGSize size = [configuration[HEMPHHUDProgressSize] CGSizeValue];
        if (!CGSizeEqualToSize(size, CGSizeZero)) {
            spinner.frame = CGRectMake(0, 0, size.width, size.height);
        }
        
        CGFloat lineWidth = [configuration[HEMPHHUDLineWidth] floatValue];
        spinner.lineWidth = lineWidth > 0 ? lineWidth : 2.0f;
    }
    
    
    [spinner startAnimating];
    
    return spinner;
}

#pragma mark - Options

+ (void)setConfiguration:(NSDictionary *)dictionary
{
    [self sharedInstance].configuration = dictionary;
}

#pragma mark - MRProgress

+ (void)showLoadingView
{
    [self showLoadingViewWithTitle:@""];
}

+ (void)showLoadingViewWithTitle:(NSString *)title
{
    [self showLoadingViewWithTitle:title inView:[self topView]];
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
        MRProgressOverlayView *overlayView  = [[MRProgressOverlayView alloc] init];
        overlayView.mode                    = MRProgressOverlayViewModeCustom;
        overlayView.titleLabelText          = title;
        overlayView.modeView                = [self createSpinner];
        overlayView.userInteractionEnabled  = blockingUI;
        
        if (color) {
            overlayView.backgroundColor = color;
        }
        
        [view addSubview:overlayView];
        [overlayView show:YES];
        
        [self sharedInstance].topView         = view;
        [self sharedInstance].numberOfAlerts  = 1;
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
        NSDictionary *configuration = [self sharedInstance].configuration;
        
        [self sharedInstance].progressView = [[GSIndeterminateProgressView alloc] initWithFrame:CGRectMake(0, navigationBar.frame.size.height, navigationBar.frame.size.width, 3)];
        [self sharedInstance].progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [self sharedInstance].progressView.hidesWhenStopped = YES;
        
        if (configuration) {
            UIColor *color = configuration[HEMPHNavigationBarProgressTintColor];
            BOOL optionIsValid = color && [color isKindOfClass:[UIColor class]];
            if (optionIsValid) {
                [self sharedInstance].progressView.progressTintColor = color;
            }
        }
        
        [navigationBar addSubview:[self sharedInstance].progressView];
    }
    
    [[self sharedInstance].progressView startAnimating];}

+ (void)dismissIndeterminateProgress
{
    [[self sharedInstance].progressView stopAnimating];
}

@end
