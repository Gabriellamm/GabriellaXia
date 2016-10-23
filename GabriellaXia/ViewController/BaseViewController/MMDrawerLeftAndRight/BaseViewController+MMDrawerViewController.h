//
//  BaseViewController+MMDrawerViewController.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/23.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "BaseViewController.h"
#import "MMDrawerController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface BaseViewController (MMDrawerViewController)
-(MMDrawerController *)addMMDrawerViewController;


@property (nonatomic,strong)LeftViewController *MMDrawerLeftVC;
@property (nonatomic,strong)RightViewController *MMDrawerRightVC;
@property (nonatomic,strong)UIViewController *MMDrawerMiddleVC;
@end
