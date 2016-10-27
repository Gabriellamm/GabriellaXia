//
//  BaseNavigationViewController.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/24.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

{

    NSInteger _systemFontSize;
}
@end

@implementation BaseNavigationViewController

-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self name:ThemeNameChange object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}




- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNeedsStatusBarAppearanceUpdate];


    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeThemeAction) name:ThemeNameChange object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fontChange:) name:UIContentSizeCategoryDidChangeNotification object:nil];

    [self changeThemeAction];
    [self fontChange:nil];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark *************function
-(void)changeThemeAction{


    ThemeManeger *themeM=[ThemeManeger shareInstance];
    UIImage *backgroundImage=[themeM  themeImage:@"mask_titlebar64@2x.png"];
    [self.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];

    UIColor *titleColor=[themeM themeColor:@"Mask_Title_color"];
    self.navigationBar.tintColor=titleColor;

}

-(void)fontChange:(NSNotification *)not{


    _systemFontSize=   [self changeSystemFont];
    
    
    
}
-(NSInteger)changeSystemFont{

    UIFont *systemfont=[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    UIFontDescriptor *fontDes=systemfont.fontDescriptor;
    NSNumber *fontNum=[fontDes objectForKey:@"NSFontSizeAttribute"];
    NSInteger  currFontBody=[fontNum integerValue];
    return currFontBody;
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
