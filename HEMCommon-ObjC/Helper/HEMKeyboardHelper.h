//
//  HEMKeyboardHelper.h
//  Pods
//
//  Created by Marcilio Junior on 8/20/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HEMKeyboardHelper : NSObject

+ (UIToolbar *)accessoryViewForController:(id)givenController
                            cancelHandler:(SEL)cancelAction
                              doneHandler:(SEL)doneAction;

@end
