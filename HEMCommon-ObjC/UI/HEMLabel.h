//
//  HEMLabel.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 3/12/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface HEMLabel : UILabel

@property (nonatomic) IBInspectable BOOL uppercaseText;
@property (nonatomic) IBInspectable BOOL lowercaseText;
@property (nonatomic) IBInspectable BOOL capitalizedText;

@end
