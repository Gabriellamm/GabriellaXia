//
//  MainTabBarController.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "MainTabBarController.h"


#import "UIView+Response.h"

@interface MainTabBarController ()
{ThemeImageView *_selectImage;
    CGFloat itemWidth;
    CGFloat imageViewHeight;
    CGFloat imageViewWidth;
}
@end

@implementation MainTabBarController
@dynamic delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    [self initSubs];
    [self initTabBar];
}

-(void)initSubs{
    NSArray *arr=[NSArray array];
    if (arr) {

        HomeViewController *HomeVC=[[HomeViewController alloc]init];

        UINavigationController *homeNV=[[UINavigationController alloc]initWithRootViewController:HomeVC];


    MessageViewController *messageVC=[[MessageViewController alloc]initWithNibName:@"MessageViewController" bundle:nil];
     UINavigationController *messageNV=[[UINavigationController alloc]initWithRootViewController:messageVC];


    MoreViewController *moreVC=[[MoreViewController alloc]initWithNibName:@"MoreViewController" bundle:nil];
     UINavigationController *moreNV=[[UINavigationController alloc]initWithRootViewController:moreVC];

    DiscoverViewController *discoverVC=[[DiscoverViewController alloc]initWithNibName:@"DiscoverViewController" bundle:nil];
     UINavigationController *discoverNV=[[UINavigationController alloc]initWithRootViewController:discoverVC];

    MeViewController *meVC=[[MeViewController alloc]initWithNibName:@"MeViewController" bundle:nil];
     UINavigationController *meNV=[[UINavigationController alloc]initWithRootViewController:meVC];
        arr=@[homeNV,messageNV,moreNV,discoverNV,meNV];
        self.viewControllers=arr;


    }


}
-(void)initTabBar{
    NSArray *subViews=[self.tabBar subviews];
    Class cls=NSClassFromString(@"UITabBarButton");
    for (UIView *view in subViews) {
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }

    ThemeImageView *tabBarView=[[ThemeImageView alloc]initWithFrame:CGRectMake(0, 0, mainScreemWidth, 49)];
    tabBarView.userInteractionEnabled=YES;
    tabBarView.imageName =@"mask_navbar.png";

    //   图片切小了   通过拉伸图片
//    [tabBarView.image  stretchableImageWithLeftCapWidth:0 topCapHeight:100];

    UIEdgeInsets edge=UIEdgeInsetsMake(20, 20, 20,20);
  //UIImageResizingModeStretch：拉伸模式，通过拉伸UIEdgeInsets指定的矩形区域来填充图片
  //UIImageResizingModeTile：平铺模式，通过重复显示UIEdgeInsets指定的矩形区域来填充图
 [tabBarView.image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];


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

    
  itemWidth=mainScreemWidth/imageNameArr.count;

    //64X45 图片的大小
  imageViewHeight  =36;
   imageViewWidth=  51.2;
      _selectImage=[[ThemeImageView alloc]initWithFrame:CGRectMake(0, 0, imageViewWidth, imageViewHeight)];
    _selectImage.imageName=@"home_bottom_tab_arrow.png";
//    _selectImage.backgroundColor=[UIColor redColor];


    for (int i=0; i<imageNameArr.count; i++) {


        ThemeButton *itemeBtn=[ThemeButton  buttonWithType:UIButtonTypeCustom];
        itemeBtn.frame= CGRectMake(i*itemWidth, 0, itemWidth, 49);
        [tabBarView addSubview:itemeBtn];
        itemeBtn.tag=i+1000;
        [itemeBtn addTarget:self action:@selector(itemButtonclick:) forControlEvents:UIControlEventTouchUpInside];


        ThemeImageView *imageView=[[ThemeImageView alloc]initWithFrame:CGRectMake(itemWidth/2.0-imageViewWidth/2.0, 0, imageViewWidth, imageViewHeight)];
        imageView.userInteractionEnabled=YES;
        imageView.imageName=imageNameArr[i];
        imageView.tag=2000+i;
//        imageView.backgroundColor=[UIColor yellowColor];
        UITapGestureRecognizer *imageTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GestureRecognizerAction:)];
        [imageView addGestureRecognizer:imageTap];

        [itemeBtn addSubview:imageView];


        ThemeLable *itemlabel=[[ThemeLable alloc]initWithFrame:CGRectMake(0, imageViewHeight,itemWidth, 49-imageViewHeight )];
        itemlabel.text=itemLabelArr[i];
        itemlabel.textAlignment=NSTextAlignmentCenter;
//        itemlabel.colorName=@"Channel_Dot_color_seleted";
        UITapGestureRecognizer *LabelTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GestureRecognizerAction:)];
        [itemlabel addGestureRecognizer:LabelTap];

        // 多语言
        [itemeBtn addSubview:itemlabel];


        //初始化 select index =0
        if (i==0) {
            _selectImage.center=imageView.center;
        }

    }

    [tabBarView addSubview:_selectImage];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


}

-(void)GestureRecognizerAction:(UITapGestureRecognizer *)sender{



    if ([sender.view isKindOfClass:[ThemeImageView class]]) {
        ThemeButton *imageNextButton=sender.view.getResponseView;
        [self itemButtonclick:imageNextButton];
    }else{

        ThemeButton *LabelNextButton=sender.view.getResponseView;
        [self itemButtonclick:LabelNextButton];
    }


}



-(void)itemButtonclick:(UIButton *)sender{
    self.selectedIndex=sender.tag-1000;

    [UIView animateWithDuration:0.3 animations:^{

        _selectImage.frame=CGRectMake(itemWidth/2.0-imageViewWidth/2.0+self.selectedIndex*itemWidth, 0, imageViewWidth, imageViewHeight);

    }];


}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
