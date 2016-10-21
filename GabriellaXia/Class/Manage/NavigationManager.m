//
//  NavigationManager.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "NavigationManager.h"


@implementation NavigationManager
{
    UINavigationController *navigationController;
}

+(NavigationManager *)shareManager{
    static dispatch_once_t token;
    static NavigationManager *shared=nil;
    dispatch_once(&token, ^{
        shared =[[NavigationManager alloc]init];
    });
    return shared;

}

-(id)init{
 self=   [super init];
    if (self) {

//        配置 moodstock 图片识别

        NSString *tokenSting=[ DataSaveTool objectForKey:appAcessToken];
        if (tokenSting) {
            MainTabBarController *tabBarC=[[MainTabBarController alloc]init];
            tabBarC.delegate=self;
            navigationController = [[UINavigationController alloc]initWithRootViewController:tabBarC];
            
        }else{
            LoginViewController *loginVC=[[LoginViewController alloc]init];
            navigationController =[[UINavigationController alloc]initWithRootViewController:loginVC];
        }

    }
    return self;
}
-(UIViewController *)rootViewController{
    return navigationController;

}

#pragma mark *************MainTabBarControllerDelegate
-(void)didMaintabBarController:(UITabBarController *)controller withObject:(id)object withEvent:(MainTabBarControllerEvent)event{
    switch (event) {
        case MainTabBarHome:{
       HomeViewController *HomeVC=[[HomeViewController alloc]init];

        [navigationController pushViewController:HomeVC animated:YES];

        }

            break;
            
        default:
            break;
//
//            MainTabBarHome,
//            MainTabBarMessage,
//            MainTabBarMore,
//            MainTabBarDiscover,
//            MainTabarMe,
    }
}
@end
