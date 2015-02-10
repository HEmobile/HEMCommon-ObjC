//
//  HEMLongPressAnimationBaseCell.m
//  HEMCommon-Samples
//
//  Created by Marcilio Junior on 2/6/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMLongPressAnimationBaseCell.h"

@interface HEMLongPressAnimationBaseCell ()

@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;

@end

@implementation HEMLongPressAnimationBaseCell

- (void)awakeFromNib
{
    if (self.longPressGesture == nil) {
        self.longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureHandler:)];
        self.longPressGesture.minimumPressDuration = 0.1;
        self.longPressGesture.cancelsTouchesInView = NO;
        [self.containerView addGestureRecognizer:self.longPressGesture];
    }
}

#pragma mark - Gesture Handler

- (void)longPressGestureHandler:(UILongPressGestureRecognizer *)gestureRecognizer
{
    [UIView animateWithDuration:0.1 animations:^{
        self.containerView.transform = CGAffineTransformMakeScale(0.97, 0.97);
    }];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.1 animations:^{
            self.containerView.transform = CGAffineTransformIdentity;
        }];
    }
}

@end
