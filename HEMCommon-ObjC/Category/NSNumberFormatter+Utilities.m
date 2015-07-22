//
//  NSNumberFormatter+Utilities.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 6/16/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "NSNumberFormatter+Utilities.h"

@implementation NSNumberFormatter (Utilities)

+ (instancetype)hem_cachedNumberFormatter
{
    static NSNumberFormatter *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NSNumberFormatter alloc] init];
    });
    
    return instance;
}

@end
