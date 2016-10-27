//
//  meHeadTableViewCell.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/25.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface meHeadTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet ThemeImageView *photoImage;
@property (weak, nonatomic) IBOutlet UIImageView *emailImage;
@property (weak, nonatomic) IBOutlet ThemeLable *namelabel;
@property (weak, nonatomic) IBOutlet ThemeLable *timeLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedC;
@property (weak, nonatomic) IBOutlet ThemeLable *LvLabel;

+(meHeadTableViewCell *)shareInstance;
@end
