//
//  HEMMaskedFloatLabeledTextField.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 5/8/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMMaskedFloatLabeledTextField.h"

NSString * HEMMaskedFloatLabeledTextFieldDefaultChar = @"#";

@interface HEMMaskedFloatLabeledTextField ()

@property (nonatomic, strong) NSString *defaultCharMask;

@end

@implementation HEMMaskedFloatLabeledTextField

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    if (self) {
        self.defaultCharMask = HEMMaskedFloatLabeledTextFieldDefaultChar;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.defaultCharMask = HEMMaskedFloatLabeledTextFieldDefaultChar;
    }
    
    return self;
}

- (BOOL)shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString * currentTextDigited = [self.text stringByReplacingCharactersInRange:range
                                                                       withString:string];
    
    if (self.mask) {
        if (string.length == 0) {
            unichar lastCharDeleted = 0;
            
            while (currentTextDigited.length > 0 && !isnumber([currentTextDigited characterAtIndex:currentTextDigited.length-1])) {
                lastCharDeleted = [currentTextDigited characterAtIndex:[currentTextDigited length] - 1];
                currentTextDigited = [currentTextDigited substringToIndex:[currentTextDigited length] - 1];
            }
            
            self.text = currentTextDigited;
            
            return NO;
        }
        
        NSMutableString * returnText = [[NSMutableString alloc] init];
        if (currentTextDigited.length > _mask.length) {
            return NO;
        }
        
        NSInteger last = 0;
        BOOL needAppend = NO;
        for (NSUInteger i = 0; i < currentTextDigited.length; i++) {
            unichar currentCharMask = [_mask characterAtIndex:i];
            unichar currentChar = [currentTextDigited characterAtIndex:i];
            
            if (isnumber(currentChar) && currentCharMask == '#') {
                [returnText appendString:[NSString stringWithFormat:@"%c",currentChar]];
            }
            else {
                if (currentCharMask == '#') {
                    break;
                }
                
                if (isnumber(currentChar) && currentChar != currentCharMask) {
                    needAppend = YES;
                }
                
                [returnText appendString:[NSString stringWithFormat:@"%c",currentCharMask]];
            }
            
            last = i;
        }
        
        for (NSUInteger i = last + 1; i < _mask.length; i++) {
            unichar currentCharMask = [_mask characterAtIndex:i];
            
            if (currentCharMask != '#') {
                [returnText appendString:[NSString stringWithFormat:@"%c",currentCharMask]];
            }
            
            if (currentCharMask == '#') {
                break;
            }
        }
        
        if (needAppend) {
            [returnText appendString:string];
        }
        
        self.text = returnText;
        
        return NO;
    }
    
    return YES;
}

@end
