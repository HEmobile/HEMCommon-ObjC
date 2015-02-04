//
//  NSDateFormatter+Utilities.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 1/23/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Utilities)

/**
 *  Returns a singleton instance of a NSDateFormatter.
 *
 *  @return Singleton instance of NSDateFormatter.
 */
+ (instancetype)hem_cachedDateFormatter;

/**
 *  Returns a date representation for a given string based on a given date format.
 *
 *  @param string The string to parse.
 *  @param format The format used to parse.
 *
 *  @return A date representation of string interpreted using the given format. If this 
 *          method cannot parse the string, it will return nil.
 */
- (NSDate *)hem_dateFromString:(NSString *)string
                        format:(NSString *)format;

/**
 *  Returns a string representation for a given date based on a given date format.
 *
 *  @param date The date to parse.
 *  @param format The format used to parse.
 *
 *  @return A string representation of date interpreted using the given format. If this
 *          method cannot parse the string, it will return nil.
 */
- (NSString *)hem_stringFromDate:(NSDate *)date
                          format:(NSString *)format;

@end
