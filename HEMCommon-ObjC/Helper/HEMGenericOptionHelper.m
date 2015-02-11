//
//  HEMGenericOptionHelper.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 2/11/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMGenericOptionHelper.h"
#import "HEMGenericOption.h"

@implementation HEMGenericOptionHelper

+ (NSArray *)optionsFromArray:(NSArray *)objects
                  parserBlock:(HEMGenericOption * (^)(id object, NSInteger index))parserBlock
{
    NSAssert(objects != nil, @"objects should not be nil");
    NSAssert(parserBlock != nil, @"parserBlock should not be nil");
    
    NSMutableArray *options = [[NSMutableArray alloc] initWithCapacity:[objects count]];
    
    for (NSUInteger i = 0; i < objects.count; i++) {
        HEMGenericOption *option = parserBlock(objects[i], i);
        if (option) {
            [options addObject:option];
        }
    }

    return [options copy];
}

@end
