//
//  UIView+Response.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/23.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "UIView+Response.h"

@implementation UIView (Response)
-(ThemeButton*)getResponseView{

    UIResponder *next=self.nextResponder;
    do {
        if ([next isKindOfClass:[ThemeButton class]]) {
            return  (ThemeButton *)next;
        }
        next=next.nextResponder;
    } while (next!=nil);

    return nil;
}


//- (ThemeButton *)viewContoller {
//
//    UIResponder *next = self.nextResponder;
//
//    do {
//        if ([next isKindOfClass:[ThemeButton class]]) {
//            return (ThemeButton *)next;
//        }
//
//        next = next.nextResponder;
//
//    } while (next != nil);
//
//    return nil;
//}
@end
