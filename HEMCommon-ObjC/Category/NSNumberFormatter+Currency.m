//
//  NSNumberFormatter+Currency.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 6/16/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "NSNumberFormatter+Currency.h"

@implementation NSNumberFormatter (Currency)

+ (instancetype)hem_cachedNumberFormatter
{
    static NSNumberFormatter *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NSNumberFormatter alloc] init];
        instance.numberStyle = NSNumberFormatterCurrencyStyle;
    });
    
    return instance;
}

+ (NSString *)hem_stringFromValue:(NSNumber *)value
               withCurrencySymbol:(NSString *)currencySymbol
                 localeIdentifier:(NSString *)localeIdentifier;
{
    NSNumberFormatter *currencyFormatter = [self hem_cachedNumberFormatter];
    currencyFormatter.locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    currencyFormatter.currencySymbol = currencySymbol;

    return [currencyFormatter stringFromNumber:value];
}

@end
