//
//  ThemeButton.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ThemeButton : UIButton
@property (nonatomic,copy)NSString *imageName;
@property (nonatomic,copy)NSString *highLightImageName;

-(void)setButtonTitle:(ThemeLable *)titleLable;
@end
