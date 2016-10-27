//
//  ThemeManeger.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ThemeNameDefualt @"Blue Moon"
#define ThemeNameChange @"ThemeNameChange"
@interface ThemeManeger : NSObject
{
    NSDictionary  *_themeConfig;
    NSDictionary  *_themeColorConfig;
}
@property (nonatomic,copy)NSString *themeName;// 当前主题的名字 默认是


+(ThemeManeger *)shareInstance;
-(UIImage *)themeImage:(NSString *)themeImage;
-(UIColor *)themeColor:(NSString *)themeColor;




@end
