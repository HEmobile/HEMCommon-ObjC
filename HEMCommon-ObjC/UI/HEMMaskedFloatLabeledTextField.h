//
//  HEMMaskedFloatLabeledTextField.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 5/8/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>

@interface HEMMaskedFloatLabeledTextField : JVFloatLabeledTextField

@property (nonatomic, strong) NSString *mask;

- (BOOL)shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end
