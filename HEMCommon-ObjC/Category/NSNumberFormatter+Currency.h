//
//  NSNumberFormatter+Currency.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 6/16/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumberFormatter (Currency)

+ (NSString *)hem_stringFromValue:(NSNumber *)value
               withCurrencySymbol:(NSString *)currencySymbol
                 localeIdentifier:(NSString *)localeIdentifier;

@end
