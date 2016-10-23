//
//  ThemeLable.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface ThemeLable : UILabel
{
    NSInteger _systemFont;
}

@property (nonatomic,copy)NSString *colorName;
@property (nonatomic,assign)NSInteger labelFont; // 系统默认为0  这里设置 0=17 1=18
@end
