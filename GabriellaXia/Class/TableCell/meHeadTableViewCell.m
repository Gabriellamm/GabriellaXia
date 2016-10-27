//
//  meHeadTableViewCell.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/25.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "meHeadTableViewCell.h"

@implementation meHeadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(meHeadTableViewCell *)shareInstance{
    NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"meHeadTableViewCell" owner:self options:nil];
    return [arr lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
