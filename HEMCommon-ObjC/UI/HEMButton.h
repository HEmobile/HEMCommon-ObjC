//
//  HEMButton.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 7/22/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface HEMButton : UIButton

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable UIColor *selectedBackgroundColor;

@end
