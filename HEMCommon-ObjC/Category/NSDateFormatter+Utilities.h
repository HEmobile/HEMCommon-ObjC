//
//  NSDateFormatter+Utilities.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 1/23/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Utilities)

+ (instancetype)hem_cachedDateFormatter;

- (NSDate *)hem_dateFromString:(NSString *)string
                    withFormat:(NSString *)format;

@end
