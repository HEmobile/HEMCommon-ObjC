//
//  HEMLoginBaseVC.h
//  HEMCommon-ObjC
//
//  Created by Marcilio Junior on 1/26/15.
//  Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HEMLoginBaseVC;
@protocol HEMLoginBaseDelegate <NSObject>

- (void)loginViewControllerClickedAtLoginButton:(HEMLoginBaseVC *)loginVC;

@end

@interface HEMLoginBaseVC : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *loginTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@property (nonatomic, weak) id<HEMLoginBaseDelegate> delegate;

@end
