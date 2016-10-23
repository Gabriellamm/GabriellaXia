//
//  ThemeLable.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "ThemeLable.h"

@implementation ThemeLable

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:ThemeNameChange object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeColor) name:ThemeNameChange object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fontChange:) name:UIContentSizeCategoryDidChangeNotification object:nil];
//        _systemFont=[self getSystemFont];

    }
    return self;
}

-(void)awakeFromNib{
  [  super awakeFromNib ];
            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeColor) name:ThemeNameChange object:nil];
            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fontChange:) name:UIContentSizeCategoryDidChangeNotification object:nil];
//            _systemFont=[self getSystemFont];

}

-(void)setLabelFont:(NSInteger )labelFont{
    if (_labelFont!=labelFont) {
        _labelFont=labelFont;
        [self fontChange:nil];
    }
}


-(void)fontChange:(NSNotification *)not{


    _systemFont=   [self getSystemFont];
    self.font=[UIFont systemFontOfSize:_systemFont+_labelFont];


}


//get system font 默认为 17
-(NSInteger)getSystemFont{
    UIFont *systemfont=[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    UIFontDescriptor *fontDes=systemfont.fontDescriptor;
    NSNumber *fontNum=[fontDes objectForKey:@"NSFontSizeAttribute"];
    NSInteger  currFontBody=[fontNum integerValue];
    return currFontBody;

}

-(void)setColorName:(NSString *)colorName{
    if (_colorName!=colorName) {
        _colorName=colorName;
        [self changeColor ];
    }
}
-(void)changeColor{

    ThemeManeger *themeM=[ThemeManeger shareInstance];
    UIColor *color=[themeM themeColor:_colorName];
    self.textColor=color;
}
@end
