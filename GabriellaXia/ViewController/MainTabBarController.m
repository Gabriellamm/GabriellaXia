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
    tabBarView.imageName =@"home_bottom_tab_arrow.png";
    [self.tabBar addSubview:tabBarView];

    // tabBarItem
    NSArray *imageNameArr = @[
                          @"home_tab_icon_1.png",
                          @"home_tab_icon_2.png",
                          @"home_tab_icon_5.png",
                          @"home_tab_icon_3.png",
                          @"home_tab_icon_4.png"
                          ];

    

    NSArray *itemLabelArr=@[getLocalizedString(@"TabBarHome"),getLocalizedString(@"TabBarMassage"),getLocalizedString(@"TabBarMore"),getLocalizedString(@"TabBarDiscorve"),getLocalizedString(@"TabBarMe")];

    
    CGFloat itemWidth=mainScreenWidth/imageNameArr.count;
    for (int i=0; i<imageNameArr.count; i++) {


        ThemeButton *itemeBtn=[ThemeButton  buttonWithType:UIButtonTypeCustom];

        itemeBtn.frame= CGRectMake(i*itemWidth, 0, itemWidth, 49);
        [tabBarView addSubview:itemeBtn];

        //64X45

        ThemeImageView *imageView=[[ThemeImageView alloc]initWithFrame:CGRectMake(i*64, 0, 64, 45)];
        imageView.center=itemeBtn.center;
        imageView.userInteractionEnabled=YES;
        imageView.imageName=imageNameArr[i];
        [itemeBtn addSubview:imageView];
        ThemeLable *itemlabel=[[ThemeLable alloc]initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth, 4)];
        itemlabel.center=itemeBtn.center;
        itemlabel.text=itemLabelArr[i];
        // 多语言
        [itemeBtn addSubview:itemlabel];
        
    }

    
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
