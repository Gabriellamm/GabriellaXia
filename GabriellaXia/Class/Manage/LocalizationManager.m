//
//  LocalizationManager.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/22.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "LocalizationManager.h"

@implementation LocalizationManager

+(LocalizationManager *)shareManager{
    static dispatch_once_t  onecToken;
    static LocalizationManager *mamager=nil;
    _dispatch_once(&onecToken, ^{
        mamager=[[LocalizationManager alloc]init];
    });
    return mamager;
}
-(NSString *)getLanguage{
    return [DataSaveTool objectForKey:languageKey];
    
}
-(void)setIanguage:(NSString *)LanguageString{
    NSString *path=nil;
    if (LanguageString) {
    path= [[NSBundle mainBundle]pathForResource:LanguageString ofType:@"lproj"];
        [DataSaveTool saveObject:LanguageString forKey:languageKey];

    }else{
// 默认的语言
        path=[[NSBundle mainBundle]pathForResource:language_chinese ofType:@"lproj"];
        [DataSaveTool saveObject:language_chinese forKey:languageKey];

    }
    bundle =[NSBundle bundleWithPath:path];

}

-(NSString *)localizedStringForKey:(NSString *)string{
    NSString *changedLanguage=[bundle localizedStringForKey:string value:nil table:nil];
    return changedLanguage;
}

-(NSString *)localizedStringForKey:(NSString *)key withLanguage:(NSString *)language{
    NSString *path=nil;
    if (language) {
        path=[[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
    }else{
        path=[[NSBundle mainBundle]pathForResource:language_chinese ofType:@"lproj"];
    }
    NSBundle *tempBundle=[NSBundle bundleWithPath:path];
    return [tempBundle localizedStringForKey:key value:nil table:nil];
}
@end
