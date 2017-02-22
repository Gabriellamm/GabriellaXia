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

@property (nonatomic,strong)UITableView *dubTableView;
@property (nonatomic,strong)UITableView *mp3TableView;
@property (nonatomic,strong)UITableView *wordTabelView;
@property (nonatomic,strong)MeProfileModel *dobModel;
@property (nonatomic,strong)meHeadTableViewCell *meHeadTab;


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

    [_meHeadTab.segmentedC addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_meHeadTab];

      [self loadData];

    if ([self.meTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.meTableView setSeparatorInset:UIEdgeInsetsZero];
    }


}





-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    if (tableView ==_dubTableView) {
        return 3;
    }if (tableView==_mp3TableView) {
        return 2;
    } else {
        return 1;
    }


    return 0;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (tableView==_dubTableView) {
        if (section==0) {
            return 4;
        }else if (section==1){
            return 2;
        }else{
            return 2;
        }
    }if (tableView==_mp3TableView) {
        return 3;

    } else {

        return 2;
    }

    return 0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell;


    if (tableView==_dubTableView) {
        static NSString *dobId=@"dobId";
        MeTableViewCell *dobCell=[tableView dequeueReusableCellWithIdentifier:dobId];// tableview 中找到复用的cell
        if (dobCell==nil) {
            dobCell=[MeTableViewCell shareInstance];
            cell=dobCell;
            dobCell.backgroundColor=[UIColor redColor];

            
        }


    }else if (tableView==_mp3TableView){

        static NSString *mp3Id=@"mp3Id";
        MeTableViewCell *mp3Cell=[tableView dequeueReusableCellWithIdentifier:mp3Id];// tableview 中找到复用的cell
        if (mp3Cell==nil) {
            mp3Cell=[MeTableViewCell shareInstance];
            cell=mp3Cell;
            mp3Cell.backgroundColor=[UIColor yellowColor];


        }
    }else{
        static  NSString *wordID=@"wordId";
        MeTableViewCell *wordCell=[tableView dequeueReusableCellWithIdentifier:wordID];
        if (wordCell==nil) {
            wordCell=[MeTableViewCell shareInstance];
            cell=wordCell;
            wordCell.backgroundColor=[UIColor blueColor];
        }
    }
    return cell;
}

#pragma mark ************* fuction

-(void)loadData{


[[ApiManager shareManager]  mewithPare:tokenn withsuccess:^(id responseBody) {
    // 1.定义一个字典


    [SVProgressHUD  show ];
    _dobModel=[MeProfileModel mj_objectWithKeyValues:responseBody];
_meHeadTab.namelabel

    [SVProgressHUD dismiss];

    [self.meTableView reloadData];


    } withFail:^(id responseBody) {

    }];

}


-(void)segmentAction:(UISegmentedControl *)segment{
    NSInteger index=segment.selectedSegmentIndex;
    switch (index) {
        case 0:
            _meTableView=_dubTableView;
            break;
         case 1:
            _meTableView=_mp3TableView;
            break;
         case 2:
            _meTableView=_wordTabelView;
        default:
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
