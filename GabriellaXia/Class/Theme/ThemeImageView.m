//
//  ThemeImageView.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "ThemeImageView.h"


@implementation ThemeImageView

-(void)dealloc{
  [  [NSNotificationCenter defaultCenter]removeObserver:self name:ThemeNameChange object:nil ];

}


-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [  [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadThemeManegerView) name:ThemeNameChange object:nil ];
    }

    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib ];
        [  [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadThemeManegerView) name:ThemeNameChange object:nil ];
}

-(void)setImageName:(NSString *)imageName{
    if (_imageName!=imageName) {
        _imageName=imageName;

        [self loadThemeManegerView];
    }
}


-(void)loadThemeManegerView{
    ThemeManeger *themeM=[ThemeManeger shareInstance];
    self.image=[themeM themeImage:_imageName];

    
}
@end
