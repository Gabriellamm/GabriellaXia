//
//  LocalizationManager.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/22.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>
#define setLanguage(language) \
[[LocalizationManager shareManager] setIanguage:(language)]

#define getLocalizedString(key) \
[[LocalizationManager shareManager] localizedStringForKey:(key)]

#define getLocalizedStringWithLanguage(key,lang) \
[[LocalizationManager shareManager] localizedStringForKey:(key) withLanguage:(lang)]

#define getLocalizedLanguage \
[[LocalizationManager shareManager] getLanguage]




@interface LocalizationManager : NSObject
{
    NSBundle * bundle;
}

+(LocalizationManager *)shareManager;
-(NSString *)getLanguage;
-(void)setIanguage:(NSString *)LanguageString;
-(NSString *)localizedStringForKey:(NSString *)string;

-(NSString *)localizedStringForKey:(NSString *)key withLanguage:(NSString *)language;

@end
