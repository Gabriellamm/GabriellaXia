//
//  MeProfileModel.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/11/12.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoModel.h"


@interface MeProfileModel :NSObject


@property (nonatomic,copy)NSString *coin;
@property (nonatomic,copy)NSString  *gender;
@property (nonatomic,copy)NSString *last_auth_method;
@property (nonatomic,copy)NSString *name;

@property (nonatomic,strong)PhotoModel *Photo;


@property (nonatomic,copy)NSNumber *score_level;//Lv
@property (nonatomic,copy)NSString *score_title;//"入行龙套"
@property (nonatomic,strong)NSNumber *sign_in_count;//签到
@property (nonatomic,copy)NSNumber *user_id;

@end

