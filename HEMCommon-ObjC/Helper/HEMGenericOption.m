//
//  HEMGenericOption.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 2/11/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMGenericOption.h"

@implementation HEMGenericOption

+ (instancetype)optionWithText:(NSString *)text
{
    return [[self alloc] initWithText:text object:nil];
}

+ (instancetype)optionWithText:(NSString *)text object:(id)object
{
    return [[self alloc] initWithText:text object:object];
}

- (instancetype)initWithText:(NSString *)text object:(id)object
{
    if (self = [super init]) {
        self.text = text;
        self.object = object;
    }
    
    return self;
}

@end
