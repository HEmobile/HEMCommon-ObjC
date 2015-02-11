//
//  HEMGenericOption.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 2/11/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HEMGenericOption : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) id object;

+ (instancetype)optionWithText:(NSString *)text;
+ (instancetype)optionWithText:(NSString *)text
                        object:(id)object;

- (instancetype)initWithText:(NSString *)text
                      object:(id)object;

@end
