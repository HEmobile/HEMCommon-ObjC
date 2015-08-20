//
//  HEMKeyboardHelper.m
//  Pods
//
//  Created by Marcilio Junior on 8/20/15.
//
//

#import "HEMKeyboardHelper.h"

@implementation HEMKeyboardHelper

+ (UIToolbar *)accessoryViewForController:(id)givenController
                            cancelHandler:(SEL)cancelAction
                              doneHandler:(SEL)doneAction
{
    NSMutableArray *items = [NSMutableArray array];
    
    UIToolbar* toolbar = [[UIToolbar alloc] init];
    [toolbar sizeToFit];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil
                                                                           action:nil];
    
    UIBarButtonItem *margin = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    margin.width = 8;
    
    if (cancelAction) {
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar"
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:givenController
                                                                        action:cancelAction];
        
        [items addObject:margin];
        [items addObject:cancelButton];
    }
    
    [items addObject:space];
    
    if (doneAction) {
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"OK"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:givenController
                                                                      action:doneAction];
        
        [items addObject:doneButton];
        [items addObject:margin];
    }
    
    toolbar.items = items;
    
    return toolbar;
}

@end
