//
//  MainTabBarController.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController
@dynamic delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabBar];
}

-(void)initTabBar{
    NSArray *subViews=[self.tabBar subviews];
    Class cls=NSClassFromString(@"UITabBarButton");
    for (UIView *view in subViews) {
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }

    ThemeImageView *tabBarView=[[ThemeImageView alloc]initWithFrame:CGRectMake(0, 0, mainScreenWidth, 49)];
    tabBarView.userInteractionEnabled=YES;
//    tabBarView.image =
    [self.tabBar addSubview:tabBarView];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
