//
//  HEMPickerHelper.m
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 8/20/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMPickerHelper.h"

@implementation HEMPickerHelper

+ (void)showPickerWithController:(id<UIPickerViewDelegate, UIPickerViewDataSource>)controller
                   cancelHandler:(SEL)cancelAction
                     doneHandler:(SEL)doneAction
                   selectedIndex:(NSInteger)selectedIndex
{
    UIToolbar *toolbar = [HEMKeyboardHelper accessoryViewForController:controller
                                                         cancelHandler:cancelAction
                                                           doneHandler:doneAction];
    
    HEMPickerContainer *container = [HEMPickerHelper viewWithPickerForController:controller
                                                                accessoryToolbar:toolbar
                                                                    defaultIndex:selectedIndex];
    
    [HEMPickerHelper showPicker:container];
}

#pragma mark - Helper

+ (HEMPickerContainer *)viewWithPickerForController:(id<UIPickerViewDelegate, UIPickerViewDataSource>)controller
                                   accessoryToolbar:(UIToolbar *)toolbar
                                       defaultIndex:(NSInteger)selectedIndex
{
    CGRect rect  = [UIApplication sharedApplication].keyWindow.bounds;
    HEMPickerContainer *pickerContainer = [[HEMPickerContainer alloc] init];
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(rect), 0)];
    
    pickerView.backgroundColor = [UIColor whiteColor];
    pickerView.dataSource = controller;
    pickerView.delegate = controller;
    
    if (selectedIndex > 0) {
        [pickerView selectRow:selectedIndex inComponent:0 animated:NO];
    }
    
    CGFloat parentHeight = CGRectGetHeight(pickerView.frame) + CGRectGetHeight(toolbar.frame);
    pickerContainer.frame = CGRectMake(0, CGRectGetHeight(rect), CGRectGetWidth(rect), parentHeight);
    
    [pickerContainer addSubview:toolbar];
    pickerView.frame = CGRectMake(0, CGRectGetHeight(toolbar.frame), CGRectGetMaxX(rect), CGRectGetHeight(pickerView.frame));
    [pickerContainer addSubview:pickerView];
    
    return pickerContainer;
}

+ (void)showPicker:(HEMPickerContainer *)picker
{
    for (UIView *v in [[UIApplication sharedApplication].keyWindow subviews]) {
        if ([v isKindOfClass:[HEMPickerContainer class]]) {
            return;
        }
    }
    
    [[UIApplication sharedApplication].keyWindow addSubview:picker];
    
    CGRect rect = [UIApplication sharedApplication].keyWindow.bounds;
    [UIView animateWithDuration:0.25 animations:^{
        picker.frame = CGRectMake(0, CGRectGetHeight(rect) - CGRectGetHeight(picker.frame), CGRectGetMaxX(rect), CGRectGetHeight(picker.frame));
    }];
}

+ (void)hidePicker
{
    for (UIView *v in [[UIApplication sharedApplication].keyWindow subviews]) {
        if ([v isKindOfClass:[HEMPickerContainer class]]) {
            CGRect rect = [UIApplication sharedApplication].keyWindow.bounds;
            
            [UIView animateWithDuration:0.25 animations:^{
                v.frame =  CGRectMake(0, CGRectGetHeight(rect), CGRectGetWidth(rect), CGRectGetHeight(v.frame));
            } completion:^(BOOL finished) {
                [v removeFromSuperview];
            }];
        }
    }
}

@end

@implementation HEMPickerContainer

@end
