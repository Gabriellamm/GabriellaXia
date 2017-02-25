//
//  MeViewController.h
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "BaseViewController.h"

//  segment 有三个跳转     （顾客）
typedef enum MeViewControllerEvent:NSUInteger{
    DubbingEvent,
    OudioEvent,
    WordEvent

}MeViewControllerEvent;

@protocol MeViewControllerDelegate <NSObject>

-(void)didMeViewController:(UIViewController *)controller withObject:(id)object withEvent:(MeViewControllerEvent)event;

@end

@interface MeViewController : BaseViewController



@property(weak,nonatomic) id<MeViewControllerDelegate> delegate;

@end
