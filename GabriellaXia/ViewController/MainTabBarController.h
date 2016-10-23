//
//  MainTabBarController.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <UIKit/UIKit.h>
// NS_OPTIONS 用于定义位移
typedef NS_ENUM  (NSInteger,MainTabBarControllerEvent){
    MainTabBarHome,
    MainTabBarMessage,
    MainTabBarMore,
    MainTabBarDiscover,
    MainTabBarMe,

};

@protocol MainTabBarControllerDelegate <NSObject>

-(void)didMaintabBarController:(UITabBarController *)controller withObject:(id)object withEvent:(MainTabBarControllerEvent)event;

@end

@interface MainTabBarController : UITabBarController
@property(weak,nonatomic) id<MainTabBarControllerDelegate> clickItemDelegate;

@end
