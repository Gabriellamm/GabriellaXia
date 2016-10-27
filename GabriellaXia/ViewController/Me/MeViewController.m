//
//  MeViewController.m
//  GabriellaXia
//
//  Created by Gabriella on 2016/10/19.
//  Copyright © 2016年 Gabriella. All rights reserved.
//

#import "MeViewController.h"
#import "meHeadTableViewCell.h"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *meTableView;

@property (nonatomic,strong)UITableView *dubTableView;
@property (nonatomic,strong)UITableView *mp3TableView;
@property (nonatomic,strong)UITableView *wordTabelView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadData];

// dubbing  mp3  word

    meHeadTableViewCell *meHeadTab=[meHeadTableViewCell shareInstance];

    _dubTableView=[[UITableView alloc]initWithFrame:_meTableView.frame style:UITableViewStylePlain];
    _dubTableView.tableHeaderView=meHeadTab;
    _dubTableView.delegate=self;
    _dubTableView.dataSource=self;
    [self.view addSubview:_dubTableView];

    _mp3TableView=[[UITableView alloc]initWithFrame:_meTableView.frame style:UITableViewStylePlain];

    _meTableView.dataSource=self;
    _meTableView.delegate=self;
    [self.view addSubview:_meTableView];

    _wordTabelView=[[UITableView alloc]initWithFrame:_meTableView.frame style:UITableViewStylePlain];
    _wordTabelView.dataSource=self;
    _wordTabelView.delegate=self;
    [self.view addSubview:_wordTabelView];


}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    if (tableView ==_dubTableView) {
        return 3;
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
    }

    return 0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    return nil;
}

-(void)loadData{



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
