//
//  HEMGenericOptionHelper.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 2/11/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEMGenericOption.h"

@interface HEMGenericOptionHelper : NSObject

+ (NSArray *)optionsFromArray:(NSArray *)objects
                  parserBlock:(HEMGenericOption * (^)(id object, NSInteger index))parserBlock;

@end
