//
//  ApiManager.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/26.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

typedef void (^Successblock) (id responseBody);
typedef void (^FailBlock) (id responseBody);

@interface ApiManager : NSObject
{
    AFHTTPSessionManager *manager;
}

+(ApiManager *)shareManager;

//meApi
 -(void)mewithPare:(id)pare  withsuccess:(Successblock)successBlock withFail:(FailBlock)failBlock;





@end
