//
//  SuperJustSimpleVC.m
//  FirstProject
//
//  Created by CZK on 2019/8/31.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SuperJustSimpleVC.h"

@interface SuperJustSimpleVC ()

@end

@implementation SuperJustSimpleVC
-(void)initSimplePros
{
    self.cellname=@"";
    self.isnib=NO;
    self.urlstr=@"";
}
-(void)supplyUI
{

}
-(void)fillFoot
{
}
- (void)viewDidLoad {
    [self initSimplePros];
    [super viewDidLoad];

    [self topViewAddTitle:self.title];
    [self supplyUI];
    [self addXiaLa];
    // Do any additional setup after loading the view.
}
-(void)addXiaLa
{
    WS(weakSelf);
    MJRefreshNormalHeader*mjh=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.refreshFoot=NO;
        [weakSelf fillTotalDatas];
    }];
    [self.tableView setMj_header:mjh];

}
-(void)fillTotalDatas_simpleVC
{

}
#pragma mark-待子类覆盖区域
-(void)fillTotalDatas
{
        //按栏目顺序设置self.totalDatas
    if (self.prevent_refresh) {
        self.prevent_refresh=NO;
        [self.tableView.mj_header endRefreshing];
        return;
    }
    if (self.data_need_token&&[UserInfoManager getToken].length==0) {
        return;
    }
    if(self.data_prevent_refresh_header&&self.is_request_body)
       {
    return;
    }
    NSString*url=self.urlstr;
    if (url.length) {
        NSMutableDictionary*paramters=[[NSMutableDictionary alloc]init];
        if (self.idstr) {
            [paramters setObject:self.idstr forKey:@"id"];
        }
        [self customRequestDic:paramters];
        WS(weakSelf);
        self.no=[[NetObj alloc]initWithUrl:url parameters:paramters Block:^(NSDictionary *resnfo) {
            [weakSelf dealServerData:resnfo];
        }];
            //    self.no.isGet=YES;
        self.is_request_body=YES;
        [self.no start];
    }
    else
        {
        if (self.pureServerDataDeal==YES) {
            [self.totalDatas removeAllObjects];
            [self.totalDatas addObject:@[@{}]];
            [self.tableView reloadData];
        }
        else
            {
            [self dealWithNowServerData:nil];
            }

        }
    [self.tableView.mj_header endRefreshing];

}
- (void)customRequestDic:(NSMutableDictionary*)dic
{

}
-(void)fillPerDataGroupNum
{
        //按栏目顺序设置每个分区几条数据为一组。
    self.perDataGroupNum=[NSMutableArray arrayWithObjects:@"1", nil];
}
-(void)fillTopView
{
}
-(CGFloat)heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (nullable UIView *)viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
-(void)registerCells
{
    NSString*cellstr=self.cellname;
    if (cellstr.length==0) {
        return;
    }
    if (self.isnib) {
        UINib*nib=[UINib nibWithNibName:cellstr bundle:nil];
        [self.tableView registerNib:nib forCellReuseIdentifier:cellstr];
    }
    else
        {
        [self.tableView registerClass:NSClassFromString(cellstr) forCellReuseIdentifier:cellstr];
        }
}
-(NSString*)dequeuenameForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellname;
}
-(Class)cellClassForIndexPath:(NSIndexPath *)indexPath
{

    return NSClassFromString(self.cellname);
}
-(CGFloat)heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
-(UIView*)viewForFooterInSection:(NSInteger)section
{
    UIView*sectionView=[[UIView alloc]init];
    sectionView.frame=RECT(0, 0, WINDOWW, [self heightForFooterInSection:section]);
    return  sectionView;
}
-(void)SuperOneTableViewCell:(SuperOneTableViewCell *)cell clickAction:(int)index
{
        //    if ([cell isKindOfClass:[UITableViewCell class]]) {
        //
        //    }

}
#pragma mark-服务器专区
-(void)dealServerData:(NSDictionary*)resnfo
{
    self.is_request_body=NO;
    if (self.pureServerDataDeal) {
        [self.totalDatas removeAllObjects];
        NSDictionary*data=[resnfo objectForKey:@"data"];
        self.resnfo=data;
        if ([data isKindOfClass:[NSDictionary class]]) {
            NSMutableArray*muarr=[[NSMutableArray alloc]init];
            [muarr addObject:data];
            [self.totalDatas addObject:muarr];
        }
        else
            {
            [self.totalDatas addObject:data];

            }


    }
    else
        {
        [self dealWithNowServerData:resnfo];
        }
    [self fillFoot];
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
    [self workNeedShowNoData];

}
-(void)dealWithNowServerData:(NSDictionary*)resnfo
{
    NSMutableArray*muarr=[[NSMutableArray alloc]init];
    NSDictionary*data=[resnfo objectForKey:@"data"];
    self.resnfo=data;
    [muarr addObject:data];
    [self.totalDatas removeAllObjects];
    [self.totalDatas addObject:muarr];
    [self.tableView reloadData];
}
#pragma mark-按钮专区
-(void)wannengBack
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
        {
        [self dismissViewControllerAnimated:YES completion:nil];
        }
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
