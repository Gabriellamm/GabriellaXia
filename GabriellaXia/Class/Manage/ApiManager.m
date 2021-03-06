//
//  ApiManager.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/26.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "ApiManager.h"


@implementation ApiManager
+(ApiManager *)shareManager{

    static dispatch_once_t onceToken;
    static ApiManager *manager=nil;

    dispatch_once(&onceToken, ^{
        manager=[[ApiManager alloc]init];
    }) ;
    return manager;
}

-(id)init{
    self=[super init];
    if (self) {
#warning  // 配置https  cer
//    AFSecurityPolicy *security =[[AFSecurityPolicy alloc]init];
//    NSString *cerPath=[[NSBundle mainBundle]pathForResource:@"https" ofType:@"cer"];
//    NSData *cerData=[NSData dataWithContentsOfFile:cerPath];
//    NSSet *cerSet=[NSSet setWithObject:cerData];
//    [security setPinnedCertificates:cerSet];

//    manager=[[AFHTTPSessionManager alloc]init];
//    manager.securityPolicy=security;
//    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
//    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil]];


        manager=[[AFHTTPSessionManager alloc]init];
//        manager.responseSerializer=[AFHTTPResponseSerializer serializer];
        [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil]];

    }
    return self;
}

-(void)mewithPare:(NSString *)token  withsuccess:(Successblock)successBlock withFail:(FailBlock)failBlock{

        NSDictionary *pare=@{@"c_carrier":carrier,@"c_dbrand":dbrand,@"c_net":net,@"c_resolution":resolution,@"device_id":device_,@"lang":response_language,@"token":token,@"trigger":tirgge,@"user_id":user_,@"v":verson};
    [manager POST:meApi parameters:pare progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        successBlock(responseObject);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        failBlock(error);
    }];

}

@end
