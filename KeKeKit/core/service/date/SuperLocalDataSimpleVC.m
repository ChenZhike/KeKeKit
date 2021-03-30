//
//  SuperLocalDataSimpleVC.m
//  KeKeKit
//
//  Created by CZK on 2019/12/19.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SuperLocalDataSimpleVC.h"

@interface SuperLocalDataSimpleVC ()

@end

@implementation SuperLocalDataSimpleVC
-(void)initSimplePros
{
    self.cellname=@"";
    self.isnib=NO;
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
        return;
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
