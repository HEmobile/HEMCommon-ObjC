//
//  HEMPickerHelper.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 8/20/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HEMKeyboardHelper : NSObject

+ (UIToolbar *)accessoryViewForController:(id)givenController
                            cancelHandler:(SEL)cancelAction
                              doneHandler:(SEL)doneAction;

@end
