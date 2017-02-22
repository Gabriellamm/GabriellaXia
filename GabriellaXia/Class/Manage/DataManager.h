//
//  DataManager.h
//  GabriellaXia
//
//  Created by Gabriella on 2017/2/21.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject


+(DataManager *)shareManager;

// 加密

+(NSDictionary *)encryptData:(NSDictionary *)pareS;

// 解密

+(NSDictionary *)decryptData:(NSDictionary *)responseObject;
@end
