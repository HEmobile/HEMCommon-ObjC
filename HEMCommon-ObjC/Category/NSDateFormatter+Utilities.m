//
//  NSDateFormatter+Utilities.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 1/23/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "NSDateFormatter+Utilities.h"

@implementation NSDateFormatter (Utilities)

+ (instancetype)hem_cachedDateFormatter
{
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NSDateFormatter alloc] init];
    });
    
    return instance;
}

- (NSDate *)hem_dateFromString:(NSString *)string
                        format:(NSString *)format
{
    self.dateFormat = format;    
    return [self dateFromString:string];
}

- (NSString *)hem_stringFromDate:(NSDate *)date
                          format:(NSString *)format
{
    self.dateFormat = format;
    return [self stringFromDate:date];
}

@end
