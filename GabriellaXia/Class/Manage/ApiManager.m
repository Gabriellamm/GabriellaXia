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

-(void)mewithPare:(id)pare  withsuccess:(Successblock)successBlock withFail:(FailBlock)failBlock{


[manager POST:apiPOST parameters:pare constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

} progress:^(NSProgress * _Nonnull uploadProgress) {

} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

}];
}

@end
