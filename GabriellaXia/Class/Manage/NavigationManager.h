//
//  NavigationManager.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MainTabBarController.h"
#import "LoginViewController.h"
#include "RegisterViewController.h"
#import "MeViewController.h"
#import "MeDubbingViewController.h"
#import "OudioViewController.h"
#import "WordViewController.h"

@interface NavigationManager : NSObject<MeViewControllerDelegate>

+(NavigationManager *)shareManager;
-(UIViewController *)rootViewController;
@end
