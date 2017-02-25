//
//  NavigationManager.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "NavigationManager.h"
#import "BaseNavigationViewController.h"



@implementation NavigationManager
{
    BaseNavigationViewController *navigationController;
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

//        NSString *tokenSting=[ DataSaveTool objectForKey:appAcessToken];
//        if (tokenSting) {
            MainTabBarController *tabBarC=[[MainTabBarController alloc]init];
            
        navigationController=[[BaseNavigationViewController alloc]initWithRootViewController:tabBarC];
        navigationController.navigationBarHidden=YES;
            
//        }else{
//            LoginViewController *loginVC=[[LoginViewController alloc]init];
//            navigationController =[[UINavigationController alloc]initWithRootViewController:loginVC];
//        navigationController.navigationBarHidden=YES;
//        }



        MeViewController *meViewController=[[MeViewController alloc]init];
        meViewController.delegate=self;




    }
    return self;
}
-(UIViewController *)rootViewController{
    return navigationController;

}





#pragma mark ************* delegate
//MeViewControllerDelegate
-(void)didMeViewController:(UIViewController *)controller withObject:(id)object withEvent:(MeViewControllerEvent)event{
    switch (event) {
        case DubbingEvent:{
            MeDubbingViewController  *dubbing=[MeDubbingViewController alloc  ];
            [navigationController pushViewController:dubbing animated:YES];
        }
            break;

        case OudioEvent:{

            OudioViewController *oudio=[[OudioViewController alloc]init];
            [navigationController pushViewController:oudio animated:YES];

        }

        case WordEvent:{
            WordViewController *word=[[WordViewController alloc]init];
            [navigationController pushViewController:word animated:YES];
        }

            

    }

}
    

@end
