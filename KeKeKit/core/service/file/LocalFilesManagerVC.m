//
//  HistoryOrLoveVC.m
//  Movie
//
//  Created by 阿文 on 3018/9/23.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import "LocalFilesManagerVC.h"
#import "FileCell.h"
#import "JustShowOfficeFilesVC.h"
@interface LocalFilesManagerVC ()<UIDocumentPickerDelegate,UIDocumentInteractionControllerDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
}

@end

@implementation LocalFilesManagerVC
-(void)fillData
{
    NSMutableArray*arr=nil;
    NSFileManager *fm=[NSFileManager defaultManager];
    NSString*dir_path=self.dirpath;


    arr=[NSMutableArray arrayWithArray:[fm contentsOfDirectoryAtPath:dir_path error:nil]];
    self.totalDatas = [[NSMutableArray alloc] init];
    NSMutableArray*muarr=[[NSMutableArray alloc]init];
    for (int i=0; i<[arr count]; i++)
        {
        NSString*nowpath=[arr objectAtIndex:i];

        NSString*name=[nowpath lastPathComponent];
        BOOL ishiddenFile=[name hasPrefix:@"."];
        if (!ishiddenFile) {
            NSString*filePath=[dir_path stringByAppendingPathComponent:name];
            NSMutableDictionary*mudic=[[NSMutableDictionary alloc]init];
            [mudic setObject:name forKey:@"name"];
            [mudic setObject:filePath forKey:@"path"];
            [muarr addObject:mudic];
        }

        }
    [self.totalDatas addObject:muarr];

    //有数据没数据时分开处理
    NSInteger count=muarr.count;
    [self tableView:self.tableView DisplayWitMsg:@"一条数据也没有，快点击排班吧" ifNecessaryForRowCount:count];
    self.editB.hidden=(count==0);
    if (self.editB.hidden) {
        self.isEditing=NO;
        [self refreshBottomViewStatus];
    }


}
-(void)fillTotalDatas
{
    [self refreshData];
    [self.tableView.mj_header endRefreshing];
}
-(void)initBottomView
{
    if (!self.bottomView) {
        CGFloat btnw=WINDOWW/3;
        self.bottomView=[[UIView alloc]initWithFrame:RECT(0, WINDOWH-self.vc_bot_h-58, WINDOWW, 58)];
        self.bottomView.backgroundColor=NatureColorNearlyWhite;

        UIButton*btn=[[UIButton alloc]initWithFrame:RECT(0, 0, btnw, self.bottomView.height)];
        self.selB=btn;
        btn.tag=0;
        btn.titleLabel.font=font(16);
        [btn setTitle:@"全选" forState:UIControlStateNormal];
        [btn setTitle:@"取消全选" forState:UIControlStateSelected];
        [btn setTitleColor:BlackColor forState:UIControlStateNormal];
        [btn setTitleColor:BlackColor forState:UIControlStateSelected];

        [btn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];

        [self.bottomView addSubview:btn];

        {
        UIButton*btn1=[[UIButton alloc]initWithFrame:RECT(btnw, 0, btnw, self.bottomView.height)];
        btn1.tag=1;
        btn1.titleLabel.font=font(16);
        [btn1 setTitle:@"删除" forState:UIControlStateNormal];
        [btn1 setTitleColor:WhiteColor forState:UIControlStateNormal];
        btn1.backgroundColor=[UIColor redColor];

        [btn1 addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];


        [self.bottomView addSubview:btn1];
        }
        {
        UIButton*btn2=[[UIButton alloc]initWithFrame:RECT(btnw*2, 0, btnw, self.bottomView.height)];
        btn2.tag=2;
        btn2.titleLabel.font=font(16);
        [btn2 setTitle:@"导出" forState:UIControlStateNormal];
        [btn2 setTitleColor:WhiteColor forState:UIControlStateNormal];
        btn2.backgroundColor=APPBlueColor;

        [btn2 addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];


        [self.bottomView addSubview:btn2];
        }



        [self.view addSubview:self.bottomView];
        self.bottomView.hidden=YES;
    }

}
//-(NSString*)title
//{
//    return @"本地文件管理";
//}
-(void)initSimplePros
{
    self.cellname=@"FileCell";
    self.isnib=YES;
    self.urlstr=@"";
    self.pureServerDataDeal=NO;
}
- (void)customRequestDic:(NSMutableDictionary*)dic
{

}
-(void)supplyUI
{
    CGFloat btnW=50;
    CGFloat btnH=30;
    {//编辑
    UIButton*btn=[UIButton tijiaoBWithTitle:@"编辑" target:self sel:@selector(editClick:)];
    btn.frame=RECT(WINDOWW-(btnW+LeftMargin)*1, 0, btnW, btnH);

    btn.centerY=NavBtnCenterY;
    [btn setTitle:@"完成" forState:UIControlStateSelected];
        self.editB=btn;
    [self.topView addSubview:btn];
    }
    [self initBottomView];

}
- (void)initTijiaoArea
{
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(0, 0, WINDOWW, 56);
//    backView.backgroundColor=[UIColor whiteColor];

    {
    UIButton*btn=[UIButton tijiaoBWithTitle:@"我要排班" target:self sel:@selector(addClick)];
    btn.centerX=WINDOWW/2;
    btn.centerY=backView.height/2;
    [backView addSubview:btn];
    }
//    if (self.footOnTableOrView) {
//        self.tableView.tableHeaderView=backView;
//    }
//    else
//        {
        backView.y=NavHeight;
        [self.view addSubview:backView];
        self.tableView.frame=RECT(0, backView.bottom, WINDOWW, WINDOWH-self.vc_bot_h-backView.bottom);
//        }

}
-(void)fillFoot
{
    [self initTijiaoArea];
}
-(void)dealWithNowServerData:(NSDictionary*)resnfo
{
    NSDictionary*data=[resnfo objectForKey:@"data"];
    self.resnfo=data;
        //处理datas
        //处理perdatagroups
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(FileCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSUInteger section=indexPath.section;
    NSUInteger row=indexPath.row;
    BOOL editing=self.isEditing;
    cell.selB.hidden=!editing;
    if (editing) {
    BOOL contain=[self.selectedRows containsObject:@(row)];
        cell.selB.selected=contain;
    }
}

-(void)SuperOneTableViewCell:(UITableViewCell *)cell clickAction:(int)index
{

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL editing=self.isEditing;
    if (editing) {
        FileCell*cell=[self.tableView cellForRowAtIndexPath:indexPath];
        NSUInteger row=indexPath.row;
        if ([self.selectedRows containsObject:@(row)]) {
            [self.selectedRows removeObject:@(row)];
            cell.selB.selected=NO;
        }
        else
            {
            [self.selectedRows addObject:@(row)];
            cell.selB.selected=YES;
            }
        NSUInteger totalNum=[self.totalDatas[0] count];
        if (totalNum==self.selectedRows.count) {
            self.selB.selected=YES;
        }
        else
            {
            self.selB.selected=NO;
            }
    }
    else
        {
        NSUInteger section=indexPath.section;
        NSUInteger row=indexPath.row;
        NSArray*arr=self.totalDatas[section];
        NSDictionary*dic=arr[row];
        NSString*urlstr=[dic objectForKey:@"path"];
        NSArray*paths=@[urlstr];
        NSArray*urls=[paths parsetToFileUrlArray];


        //预览展示xls
        JustShowOfficeFilesVC*vc=[[JustShowOfficeFilesVC alloc]initWithFileUrls:urls];

        [self.navigationController pushViewController:vc animated:YES];
//        webview展示xls
//        FunctionDefaultVC*fdvc=[[FunctionDefaultVC alloc]initWithUrl:urlstr];
//        fdvc.title=[dic objectForKey:@"name"];
//        fdvc.isLocalFile=YES;
//        [self.navigationController pushViewController:fdvc animated:YES];
        }
}
#pragma mark-按钮区
-(void)bottomBtnClick:(UIButton*)sender
{
if(sender.tag==0)
    {//全选
        sender.selected=!sender.selected;
        [self.selectedRows removeAllObjects];
        if (sender.selected) {
            NSArray*arr=self.totalDatas[0];
            for (int i=0; i<arr.count; i++) {
                [self.selectedRows addObject:@(i)];
            }
        }
        [self.tableView reloadData];
    }
    else if(sender.tag==1)
        {//删除
            if (self.selectedRows.count==0) {
                [SVProgressHUD showSuccessWithStatus:@"删除了0条数据"];
            }
            else
                {
                [self deleteSelectedDatas];
                }
        }
    else
        {
        //导出
        if (self.selectedRows.count==0) {
            [SVProgressHUD showSuccessWithStatus:@"导出了0条数据"];
        }
        else
            {
            [self exportXls];
            }
        }
}
//导出xls
- (void)exportXls
{
    NSMutableArray*selected_url_datas=[[NSMutableArray alloc]init];
    NSArray*orginarr=self.totalDatas[0];
    for (int i=0; i<orginarr.count; i++) {
        NSDictionary*dic=orginarr[i];
        if ([self.selectedRows containsObject:@(i)]) {
            NSString*path=[dic objectForKey:@"path"];
            NSURL*url=[NSURL fileURLWithPath:path];
            [selected_url_datas addObject:url];
        }

    }
//    for (NSDictionary*dic in self.totalDatas[0]) {
//        NSString*path=[dic objectForKey:@"path"];
//        NSURL*url=[NSURL fileURLWithPath:path];
//        [muarr addObject:url];
//    }
    self.selected_url_datas=selected_url_datas;
//    if (@available(iOS 11.0, *)) {
//        UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithURLs:selected_url_datas inMode:UIDocumentPickerModeExportToService];
//        documentPicker.delegate = self;
//        documentPicker.modalPresentationStyle = UIModalPresentationFormSheet;
//        [self presentViewController:documentPicker animated:YES completion:nil];
//    } else {
        self.export_index=0;
        [self tryShowOneExportUrl];
//        }
}
#pragma mark-UIDocumentInteractionControllerDelegate
- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller
{
    self.export_index++;
    [self tryShowOneExportUrl];
}
-(void)tryShowOneExportUrl
{
    int index=self.export_index;
    NSArray*arr=self.selected_url_datas;
    if (index<=arr.count-1) {
        NSURL*url=[arr objectAtIndex:index];
        documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        [documentInteractionController setDelegate:self];

        [documentInteractionController presentOpenInMenuFromRect:self.view.bounds inView:self.view animated:YES];
    }

}
-(void)addClick
{



}
-(void)editClick:(UIButton*)sender
{
    self.isEditing=!self.isEditing;
    sender.selected=self.isEditing;
    [self refreshBottomViewStatus];
}
-(void)refreshBottomViewStatus
{
    if(self.isEditing)
        {
        self.tableView.height=WINDOWH-NavHeight-self.vc_bot_h-self.bottomView.height;
        [self.selectedRows removeAllObjects];
        }
    else
        {
        self.tableView.height=WINDOWH-NavHeight-self.vc_bot_h;
        }
    [self.tableView reloadData];
    self.bottomView.hidden=!self.isEditing;
}
-(void)deleteSelectedDatas
{
    NSArray*rows=self.selectedRows;
    NSArray*datas=self.totalDatas[0];
    for (NSNumber*num in rows) {
        int row=[num intValue];
        NSDictionary*dic=[datas objectAtIndex:row];
        NSString*filepath=[dic objectForKey:@"path"];
        [[NSFileManager defaultManager]removeItemAtPath:filepath error:nil];
    }
    NSString*tishi=[NSString stringWithFormat:@"删除了%lu条数据",(unsigned long)self.selectedRows.count];
    [SVProgressHUD showSuccessWithStatus:tishi];
    [self.selectedRows removeAllObjects];
    [self refreshData];
}
-(void)refreshData
{
    [self fillData];
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.fillDataTimeMode=FillDataTimeModeWillAppear;
    self.selectedRows=[[NSMutableArray alloc]init];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self fillFoot];

        // Do any additional setup after loading the view.
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
