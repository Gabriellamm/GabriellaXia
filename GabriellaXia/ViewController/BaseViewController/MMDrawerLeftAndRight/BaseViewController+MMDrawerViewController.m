//
//  BaseViewController+MMDrawerViewController.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/23.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "BaseViewController+MMDrawerViewController.h"

@implementation BaseViewController (MMDrawerViewController)
@dynamic  MMDrawerLeftVC;
@dynamic MMDrawerRightVC;
@dynamic MMDrawerMiddleVC;

-(MMDrawerController *)addMMDrawerViewController{

    if (self.MMDrawerMiddleVC&&self.MMDrawerLeftVC&&self.MMDrawerRightVC) {

       MMDrawerController *MMDrawer = [[MMDrawerController alloc]initWithCenterViewController:self.MMDrawerMiddleVC leftDrawerViewController:self.MMDrawerLeftVC rightDrawerViewController:self.MMDrawerRightVC];

        [MMDrawer setMaximumLeftDrawerWidth:150];
        [MMDrawer setMaximumRightDrawerWidth:120];
        return MMDrawer;
    }
    return nil;

}

@end
