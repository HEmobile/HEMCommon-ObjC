//
//  NSNumberFormatter+Currency.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 6/16/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "NSNumberFormatter+Currency.h"
#import "NSNumberFormatter+Utilities.h"

@implementation NSNumberFormatter (Currency)

+ (NSString *)hem_stringFromValue:(NSNumber *)value
               withCurrencySymbol:(NSString *)currencySymbol
                 localeIdentifier:(NSString *)localeIdentifier;
{
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter hem_cachedNumberFormatter] copy];
    currencyFormatter.locale         = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    currencyFormatter.numberStyle    = NSNumberFormatterCurrencyStyle;
    currencyFormatter.currencySymbol = currencySymbol;

    return [currencyFormatter stringFromNumber:value];
}

@end
