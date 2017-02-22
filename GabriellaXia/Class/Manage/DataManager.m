//
//  DataManager.m
//  GabriellaXia
//
//  Created by Gabriella on 2017/2/21.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager


+(DataManager *)shareManager{
    static dispatch_once_t pred;
    static  DataManager *manager=nil;
    dispatch_once(&pred, ^{
        manager=[[DataManager alloc]init];
    }) ;

    return manager;
}

// 加密

+(NSDictionary *)encryptData:(NSDictionary *)pareS{

    NSString *seedStr=[NSString stringWithFormat:@"%f",[[NSDate date]timeIntervalSince1970]];
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:pareS options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];

   NSString *dataToPost= [[CryptoManager getInstance] encryptDataWithDataString:jsonStr withSeed:seedStr];

    NSString *dataStr=[NSString stringWithFormat:@"%@%@",dataToPost,seedStr];

    NSMutableDictionary *mutableDic=[[NSMutableDictionary alloc]init];
    [mutableDic setObject:dataStr forKey:@"data"];
    return [mutableDic copy];

}

// 解密

+(NSDictionary *)decryptData:(NSDictionary *)responseObject{

    NSString *allData=[responseObject objectForKey:@"data"];
    NSArray *dataArr=[allData componentsSeparatedByString:@","];
    NSString * decryptData=[dataArr firstObject];
    NSString *decryptSeed=[dataArr lastObject];
    NSString *decryptStr=[[CryptoManager getInstance]decryptDataWithDataString:decryptData withSeed:decryptSeed];

    NSDictionary *responseDic=[NSJSONSerialization JSONObjectWithData:[decryptStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];

    return responseDic;

}


@end
