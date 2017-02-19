//
//  MeTableViewCell.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/11/14.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "MeTableViewCell.h"

@implementation MeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



+(MeTableViewCell *)shareInstance{
    NSArray *arr=[[NSBundle mainBundle] loadNibNamed:@"MeTableViewCell" owner:self options:nil];
    return [arr lastObject];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
