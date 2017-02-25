//
//  MeDubbingViewController.m
//  GabriellaXia
//
//  Created by Gabriella on 2017/2/25.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "MeDubbingViewController.h"

@interface MeDubbingViewController ()

@end

@implementation MeDubbingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.title = getLocalizedString(@"dubbing");

    self.dubbingTableView.backgroundColor=[UIColor redColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
