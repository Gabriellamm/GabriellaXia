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

@interface NavigationManager : NSObject<MainTabBarControllerDelegate>

+(NavigationManager *)shareManager;
-(UIViewController *)rootViewController;
@end
