//
//  DataSaveTool.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "DataSaveTool.h"

@implementation DataSaveTool



+(void)saveBool:(BOOL)b forKey:(NSString *)key
{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    [def setBool:b forKey:key];
    [def synchronize];
}
+(BOOL)boolForKey:(NSString *)key{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    return    [def boolForKey:key];

}



+(void)saveObject:(id)object forKey:(NSString *)key{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    [def setObject:object forKey:key];
    [def synchronize];

}
+(id)objectForKey:(NSString *)key;
{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
  return   [def objectForKey:key];
}

@end
