//
//  HEMTextField.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 3/12/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMTextField.h"

@interface HEMTextField () <UITextFieldDelegate>

@end

@implementation HEMTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    self.delegate = self;
    
    self.uppercaseText = NO;
}

- (void)setUppercaseText:(BOOL)uppercaseText
{
    _uppercaseText = uppercaseText;
    
    if (uppercaseText) {
        self.text = self.text.uppercaseString;
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (self.uppercaseText) {
        NSRange lowercaseCharRange = [string rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]];
        
        if (lowercaseCharRange.location != NSNotFound) {
            textField.text = [textField.text stringByReplacingCharactersInRange:range
                                                                     withString:[string uppercaseString]];
            return NO;
        }
    }
    
    return YES;
}

@end
