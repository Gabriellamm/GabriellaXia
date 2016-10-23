//
//  ThemeButton.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "ThemeButton.h"

@implementation ThemeButton

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:ThemeNameChange object:nil];
}


+ (instancetype)buttonWithType:(UIButtonType)buttonType{
 ThemeButton *themButton =   [super buttonWithType:buttonType];
    if (themButton) {

        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(chageButton) name:ThemeNameChange object:nil ];
    }

    return themButton;
}



-(void)awakeFromNib{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(chageButton) name:ThemeNameChange object:nil ];


}


-(void)setButtonTitle:(ThemeLable *)titleLable{
    if (titleLable) {
        titleLable.frame=CGRectMake(0, self.frame.size.height/4, self.frame.size.width, self.frame.size.height/2);
        titleLable.center=self.center;
        titleLable.textAlignment=NSTextAlignmentCenter;
       [ self addSubview:titleLable];
    }

}

-(void)setImageName:(NSString *)imageName{
    if (_imageName!=imageName) {
        _imageName=imageName;
        [self chageButton];

    }

}

-(void)setHighLightImageName:(NSString *)highLightImageName{

    if (_highLightImageName!=highLightImageName) {
        _highLightImageName=highLightImageName;
        [self chageButton];
    }
}

-(void)chageButton{

    ThemeManeger *themeM=[ThemeManeger shareInstance];
    UIImage *imageNormal=[themeM themeImage:_imageName];
    UIImage *highLightImage=[themeM themeImage:_highLightImageName];

    if (imageNormal) {
         [self setBackgroundImage:imageNormal forState:UIControlStateNormal];
    }

    if (highLightImage) {
        [self setBackgroundImage:highLightImage forState:UIControlStateHighlighted];
    }

}
@end
