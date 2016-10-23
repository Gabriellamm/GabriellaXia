//
//  ThemeManeger.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "ThemeManeger.h"



@implementation ThemeManeger

    +(ThemeManeger *)shareInstance{
        static dispatch_once_t token;
        static ThemeManeger *shared=nil;
        dispatch_once(&token, ^{
            shared =[[ThemeManeger alloc]init];
        });
        return shared;

    }

    -(id)init{
        self=   [super init];
        if (self) {
            _themeName=ThemeNameDefualt;
            //如果本地有主题 就用本地
            NSString *saveThemeName=[DataSaveTool objectForKey:ThemeNameChange];
            if (saveThemeName.length!=0) {
                _themeName=saveThemeName;
            }
            

            [self themePath];

        }
        return self;
    }

// theme 的路径
-(void)themePath{
    NSString *themeCofigPath=[[NSBundle mainBundle]pathForResource:@"theme.plist" ofType:nil ];
    _themeConfig=[[NSDictionary alloc]initWithContentsOfFile:themeCofigPath];

    //skin/主题／colorCof
    NSString *themePath=[self getCurrentThemerPath];
    NSString *ThemeColorPath=[themePath stringByAppendingPathComponent:@"config.plist"];
    _themeColorConfig=[[NSDictionary alloc]initWithContentsOfFile:ThemeColorPath];
}

// 当前主题包的路径
-(NSString *)getCurrentThemerPath{

    NSString *resourcesPath=[[NSBundle mainBundle] resourcePath];
    NSString *imagePath=[_themeConfig objectForKey:_themeName];
    NSString  *themePath=[resourcesPath stringByAppendingPathComponent:imagePath];

    return themePath;
}


-(void)setThemeName:(NSString *)themeName{
    if (_themeName!=themeName) {
        _themeName=themeName;
        [DataSaveTool saveObject:_themeName forKey:ThemeNameChange];
        [self themePath];

        [[NSNotificationCenter defaultCenter]postNotificationName:ThemeNameChange object:nil ];

    }

}


-(UIImage *)themeImage:(NSString *)themeImage{

    if (themeImage.length==0) {
        return nil;
    }
    NSString *imagePath=[[self getCurrentThemerPath]stringByAppendingPathComponent:themeImage];
    UIImage *image=[UIImage imageWithContentsOfFile:imagePath];
    return image;

}
-(UIColor *)themeColor:(NSString *)themeColor{

    if (themeColor.length==0) {
        return nil;
    }
    NSDictionary *colorDic=[_themeColorConfig objectForKey:themeColor];
    CGFloat R=[colorDic[@"R"] floatValue];
    CGFloat G=[colorDic[@"G"] floatValue];
    CGFloat B=[colorDic [@"B" ] floatValue];


    UIColor *color=COLOR(R, G, B)
    return color;
}


@end
