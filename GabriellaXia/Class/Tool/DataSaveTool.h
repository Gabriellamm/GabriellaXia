//
//  DataSaveTool.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSaveTool : NSObject


/**
 *  保存bool 和保存

 */
+(void)saveBool:(BOOL)b forKey:(NSString *)key;
+(BOOL)boolForKey:(NSString *)key;

/**
 *   保存对象
 *

 */
+(void)saveObject:(id)object forKey:(NSString *)key;
+(id)objectForKey:(NSString *)key;


@end
