//
//  HEMLabel.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 3/12/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMLabel.h"

@implementation HEMLabel

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
    self.uppercaseText = NO;
    self.lowercaseText = NO;
    self.capitalizedText = NO;
}

- (void)setUppercaseText:(BOOL)uppercaseText
{
    _uppercaseText = uppercaseText;
    
    if (uppercaseText) {
        self.text = self.text.uppercaseString;
    }
}

- (void)setLowercaseText:(BOOL)lowercaseText
{
    _lowercaseText = lowercaseText;
    
    if (lowercaseText) {
        self.text = self.text.lowercaseString;
    }
}

- (void)setCapitalizedText:(BOOL)capitalizedText
{
    _capitalizedText = capitalizedText;
    
    if (capitalizedText) {
        self.text = self.text.capitalizedString;
    }
}

@end
