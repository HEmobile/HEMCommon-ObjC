//
//  HEMRoundedImageView.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 3/11/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface HEMImageView : UIImageView

@property (nonatomic) IBInspectable CGFloat radius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable UIColor *borderColor;

@end
