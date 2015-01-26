//
//  HEMLoginBaseVC.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 1/26/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMLoginBaseVC.h"

@interface HEMLoginBaseVC ()

@end

@implementation HEMLoginBaseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureTextFields];
}

#pragma mark - Helpers

- (void)configureTextFields
{
    self.passwordTextField.keyboardAppearance = UIKeyboardAppearanceDark;
    self.passwordTextField.secureTextEntry = YES;
}

- (void)configureLoginButton
{
    [self.loginButton addTarget:self
                         action:@selector(loginButtonTouched:)
               forControlEvents:UIControlEventTouchUpInside];
}

- (void)loginButtonTouched:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(loginViewControllerClickedAtLoginButton:)]) {
        [self.delegate loginViewControllerClickedAtLoginButton:self];
    }
}

@end
