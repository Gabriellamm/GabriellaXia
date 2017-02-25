//
//  MeViewController.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "MeViewController.h"
#import "meHeadTableViewCell.h"
#import "MeProfileModel.h"
#import "MeTableViewCell.h"


@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *meTableView;

@property (nonatomic,strong)MeProfileModel *dobModel;
@property (nonatomic,strong)meHeadTableViewCell *meHeadTab;

@property (nonatomic,assign)NSInteger _selectedSegmentIndex;//  对比是否要选择 reload


@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;


    _meHeadTab=[meHeadTableViewCell shareInstance];
    _meHeadTab.frame=CGRectMake(0, 0, mainScreemWidth, 200);


    [_meHeadTab.segmentedC setTitle:getLocalizedString(@"dobbing") forSegmentAtIndex:0];
    [_meHeadTab.segmentedC setTitle:getLocalizedString(@"oudio") forSegmentAtIndex:1];
    [_meHeadTab.segmentedC setTitle:getLocalizedString(@"word") forSegmentAtIndex:2];
    _meHeadTab.segmentedC.selectedSegmentIndex=0; // 默认 0
    __selectedSegmentIndex=0;

    [_meHeadTab.segmentedC addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.meTableView setTableHeaderView:_meHeadTab];

    // 如果要改变 tableview head view

//    [self.meTableView  beginUpdates];
//    [self.meTableView setTableHeaderView:_meHeadTab];//  新的高度
//    [self.meTableView endUpdates];



      [self loadData];

    if ([self.meTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.meTableView setSeparatorInset:UIEdgeInsetsZero];
    }


}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return 3;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    switch (section) {
        case 0:
            return 5;
            break;

        case 1:
            return 4;
            break;

        case 2:
            return 3;
            break;

    }
    
    return 0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MeTableViewCell *cell=[MeTableViewCell shareInstance];


       return cell;
}

#pragma mark ************* fuction

-(void)loadData{


[[ApiManager shareManager]  mewithPare:tokenn withsuccess:^(id responseBody) {
    // 1.定义一个字典


    [SVProgressHUD  show ];
    _dobModel=[MeProfileModel mj_objectWithKeyValues:responseBody];


    [SVProgressHUD dismiss];

    [self.meTableView reloadData];


    } withFail:^(id responseBody) {

    }];

}


-(void)segmentAction:(UISegmentedControl *)segment{

    switch (segment.selectedSegmentIndex) {
        case 0:
            [self.delegate didMeViewController:self withObject:nil withEvent:DubbingEvent];
            break;
            
       case 1:
            [self.delegate didMeViewController:self withObject:nil withEvent:OudioEvent];
            break;

            case 2:
            [self.delegate didMeViewController:self withObject:nil withEvent:WordEvent];
            break;
    }


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
