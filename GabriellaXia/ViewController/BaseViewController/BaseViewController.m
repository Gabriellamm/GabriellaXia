//
//  BaseViewController.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:ThemeNameChange object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeThemeAction) name:ThemeNameChange object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fontChange:) name:UIContentSizeCategoryDidChangeNotification object:nil];

    }
    return self;
}


-(instancetype)init{
    self=[super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeThemeAction) name:ThemeNameChange object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fontChange:) name:UIContentSizeCategoryDidChangeNotification object:nil];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    _systemFontSize=   [self getSystemFont];
    [self changeThemeAction];
    // Do any additional setup after loading the view from its nib.
}




#pragma mark *************function
-(void)changeThemeAction {

    ThemeManeger *manager=[ThemeManeger shareInstance];
    UIImage *image=[manager themeImage:@"bg_home.jpg"];
    self.view.backgroundColor=[UIColor colorWithPatternImage:image];

}

-(void)fontChange:(NSNotification *)not{


    _systemFontSize=   [self getSystemFont];



}


//get system font 默认为 17
-(NSInteger)getSystemFont{
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
