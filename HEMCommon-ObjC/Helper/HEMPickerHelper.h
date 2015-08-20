//
//  HEMPickerHelper.h
//  Pods
//
//  Created by Marcilio Junior on 8/20/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HEMKeyboardHelper.h"

@interface HEMPickerContainer : UIView

@end

@interface HEMPickerHelper : NSObject

+ (void)showPickerWithController:(id<UIPickerViewDelegate, UIPickerViewDataSource>)controller
                   cancelHandler:(SEL)cancelAction
                     doneHandler:(SEL)doneAction
                   selectedIndex:(NSInteger)selectedIndex;

+ (void)hidePicker;

@end
