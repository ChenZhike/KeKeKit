    //
    //  SuperOneVC.m
    //  FirstProject
    //
    //  Created by KeKe on 3018/9/14.
    //  Copyright © 3018年 awen. All rights reserved.
    //

#import "SuperOneVC.h"
@interface SuperOneVC ()<UITableViewDelegate,UITableViewDataSource,SuperOneTableViewCellDelegate>

@end

@implementation SuperOneVC

-(void)customViewWantShow
{
        //    [self viewDidAppear:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
        //            self.fd_prefersNavigationBarHidden=YES;
    self.totalDatas=[[NSMutableArray alloc]init];
    self.perDataGroupNum=[[NSMutableArray alloc]init];
    self.nos=[[NSMutableArray alloc]init];

    self.current=1;
        //    self.view.backgroundColor=WhiteColor;
    self.view.backgroundColor=NatureColorNearlyWhite;
    [self createTop];

    [self addTable];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self registerCells];

    [self fillPerDataGroupNum];

    [self configseq_reqs];
    BOOL pre_token_ok=[self pre_token_ok];
    if (self.seq_urls.count&&pre_token_ok) {
        [self fillSeq_RequWithSels:self.seq_urls parameters:self.seq_url_dics];
    }
    else
        {
        if (self.fillDataTimeMode==FillDataTimeModeDidLoad) {
            [self tablebeginrefreshData];
        }
        }
    if (self.needDealHideBottom==NO) {
        [self addBackBtn];
    }

        // Do any additional setup after loading the view.
}
-(void)tablebeginrefreshData
{
    if (self.seq_req_datas.count!=self.seq_urls.count) {
        return;
    }
    if (self.tableView.mj_header) {
        [self.tableView.mj_header beginRefreshing];
    }
    else
        {
        [self fillTotalDatas];
        }
}
- (void)configseq_reqs
{
}
    //- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    //    if (self.tableView.contentOffset.x <= 0) {
    //        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
    //            return YES;
    //        }
    //    }
    //    return NO;
    //}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.fillDataTimeMode==FillDataTimeModeWillAppear) {
        [self.tableView.mj_header beginRefreshing];
    }
    if (self.needDealHideBottom) {
        ViewController*vc=(ViewController*)self.navigationController.parentViewController;
        SEL asel=NSSelectorFromString(@"setBottomHide:who:");
        [vc performSelector:asel withObjects:@[@(NO),self]];

//        [vc setBottomHide:NO who:self];
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.fillDataTimeMode==FillDataTimeModeDidAppear) {
        [self fillTotalDatas];
    }

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.needDealHideBottom) {
        ViewController*vc=(ViewController*)self.navigationController.parentViewController;
        SEL asel=NSSelectorFromString(@"setBottomHide:who:");
        [vc performSelector:asel withObjects:@[@(YES),self]];
//        [vc setBottomHide:YES who:self];
    }
}
#pragma mark-request
-(BOOL)pre_token_ok
{
    return ((self.seq_need_token==NO)||([UserInfoManager getToken].length>0));
}
#pragma mark-top
-(void)createTop
{
    self.topView=[[UIView alloc]initWithFrame:RECT(0, 0, WINDOWW, NavHeight)];
    [self.view addSubview:self.topView];
}
-(void)topViewAddTitle:(NSString*)title
{
    UIFont*titleFont=font(17);
    UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(0, kStatusBarHeight, WINDOWW/2, NavHeight-kStatusBarHeight)];
    alab.center=CGPointMake(WINDOWW/2, NavBtnCenterY);
    alab.font=titleFont;
    alab.textColor=BlackColor;
    alab.text=title;
    alab.textAlignment=NSTextAlignmentCenter;
    self.titleLab=alab;


    [self.topView addSubview:alab];
}
-(void)topViewAddLine
{
    UIView*fatherview=self.topView;
    UIView*lineview= [[UIView alloc]initWithFrame:RECT(0, fatherview.height-0.5, fatherview.width, 0.5)];
    lineview.backgroundColor=LineColor;
    [fatherview addSubview:lineview];
}
-(void)addTable
{
    CGFloat botH=self.needDealHideBottom?BottomViewH:kHomeBarHeight;
    self.tableView=[[UITableView alloc]initWithFrame:RECT(0, NavHeight, WINDOWW, WINDOWH-NavHeight-botH)style:UITableViewStyleGrouped];
    self.tableView.tableHeaderView=[[UIView alloc]initWithFrame:RECT(0, 0, WINDOWW, 0.1)];
        //    self.tableView.backgroundColor=[UIColor clearColor];
    self.tableView.backgroundColor=NatureColorNearlyWhite;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];

    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;

        //    WS(weakSelf);
        //    MJRefreshNormalHeader*mjh=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //        weakSelf.refreshFoot=NO;
        //        [weakSelf fillTotalDatas];
        //    }];
        //    [self.tableView setMj_header:mjh];
}
#pragma mark-tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.totalDatas.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [self heightForHeaderInSection:section];
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self viewForHeaderInSection:section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self numberOfRowsInSection:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self heightForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellForRowAtIndexPath: indexPath];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [self heightForFooterInSection:section];
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [self viewForFooterInSection:section];
}
#pragma mark-可共用抽象区
- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSArray*arr=self.totalDatas[section];
    NSUInteger chu1=arr.count;
    int chu2=[self.perDataGroupNum[section] intValue];

    NSUInteger result= (chu1%chu2==0)?(chu1/chu2):(chu1/chu2+1);
    return result;
}
- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class c=[self cellClassForIndexPath:indexPath];
    NSObject*objdata=[self dataForIndexPath:indexPath];
    CGFloat h= [c suggestedHWithData:objdata];
    return h;
}
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject*objdata=[self dataForIndexPath:indexPath];

    NSString*dequeuename=[self dequeuenameForRowAtIndexPath:indexPath];
    SuperOneTableViewCell*cell=[self.tableView dequeueReusableCellWithIdentifier:dequeuename];
    cell.actionDelegate=self;
        //    NSUInteger section=indexPath.section;
        //    NSUInteger row=indexPath.row;
    [cell configWithData:objdata];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(NSObject*)dataForIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section=indexPath.section;
    NSUInteger row=indexPath.row;
        //    NSLog(@"section:%d,row:%d",section,row);
    NSArray*sondatas=self.totalDatas[section];
    int nowGroupNum=[self.perDataGroupNum[section]intValue];
    if (nowGroupNum==1) {
        return sondatas[row];
    }
    else
        {
        NSMutableArray*result=[[NSMutableArray alloc]init];
        int startindex=nowGroupNum*indexPath.row;
        for ( int i=0; i<nowGroupNum; i++) {
            int index=startindex+i;
            if ( index<sondatas.count) {
                [result addObject:(sondatas[index])];
            }

        }
        return result;
        }

}

#pragma mark-待子类覆盖区域
-(void)fillTotalDatas
{
        //按栏目顺序设置self.totalDatas
}
-(void)fillPerDataGroupNum
{
        //按栏目顺序设置每个分区几条数据为一组。
}
-(void)fillTopView
{

}
-(void)addBackBtn
{
    UIButton*btn=[UIButton getAppCommonBackBtn];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(wannengBack) forControlEvents:UIControlEventTouchUpInside];
}
-(void)registerCells
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

-(NSString*)dequeuenameForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
-(Class)cellClassForIndexPath:(NSIndexPath *)indexPath
{

    return [SuperOneTableViewCell class];
}
-(CGFloat)heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
-(UIView*)viewForFooterInSection:(NSInteger)section
{
    UIView*footview= [[UIView alloc]initWithFrame:RECT(0, 0, WINDOWW, 0.1)];
    footview.backgroundColor=[UIColor clearColor];
    return footview;
}
-(void)SuperOneTableViewCell:(SuperOneTableViewCell *)cell clickAction:(int)index
{

}
- (void)tableView:(UITableView*)tb DisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount
{
    if (rowCount == 0) {
            // 没有数据的时候，UILabel的显示样式
        UILabel *messageLabel = [UILabel new];
        messageLabel.text = message;
        messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        messageLabel.textColor = [UIColor lightGrayColor];
            //        label居中
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabel sizeToFit];

        tb.backgroundView = messageLabel;
    } else {
        tb.backgroundView = nil;
    }
}
-(void)wannengBack
{
    if (self.navigationController) {
        SuperOneVC*sovc=(SuperOneVC*)self.navigationController.viewControllers[0];
        if (sovc!=self) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
            {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }
    }
    else
        {
        [self dismissViewControllerAnimated:YES completion:nil];
        }
}
-(CGFloat)vc_bot_h
{
    CGFloat h= self.needDealHideBottom?BottomViewH:kHomeBarHeight;
    return h;
}
-(void)fillFoot
{
}
#pragma mark-底部按钮区
-(UIView*)getTijiaoAreaView
{
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(0, 0, WINDOWW, 75);
    backView.backgroundColor=[UIColor clearColor];

    {
    UIButton*btn=[UIButton tijiaoBWithTitle:self.tijiao_title target:self sel:@selector(tijiaoClick)];
    btn.centerX=WINDOWW/2;
    btn.centerY=backView.height/2;
    [backView addSubview:btn];
    }
    return backView;
}
#pragma mark-请求数组区
- (void)fillSeq_RequWithSels:(NSArray*)urls parameters:(NSArray*)parameters
{
    NSMutableArray*datas=[[NSMutableArray alloc]init];
    for (int i=0; i<urls.count; i++) {
        [datas addObject:@{}];
        NSString*url=urls[i];
        NSDictionary*dic=nil;
        if (parameters.count>i) {
            dic=parameters[i];
        }
        WS(weakSelf);
        NetObj*no=[[NetObj alloc]initWithUrl:url parameters:dic Block:^(NSDictionary *resnfo) {
            NSString*retCode=[resnfo objectForKey:@"retCode"];
            if ([retCode isEqualToString:@"100"]) {
                    //[SVProgressHUD showSuccessWithStatus:[resnfo objectForKey:@"retMsg"]];
                [weakSelf dealSeq_RequestServerData:resnfo];
            }
            else
                {
                [SVProgressHUD showErrorWithStatus:[resnfo objectForKey:@"retMsg"]];
                }
        }];
        no.obj_tag=i;
        [no start];
        [self.nos addObject:no];
    }
    self.seq_req_datas=datas;
}
-(void)dealSeq_RequestServerData:(NSDictionary*)resnfo
{
    int idnex=[[resnfo objectForKey:NetObjTagKey]intValue];
    NSDictionary*data=[resnfo objectForKey:@"data"];
    [self.seq_req_datas replaceObjectAtIndex:idnex withObject:data];
    self.seq_reqs_successed_num++;
    if (self.seq_reqs_successed_num>=self.seq_urls.count) {
        [self performSelector:NSSelectorFromString(self.seq_request_total_deal_SelStr)];
    }
}
#pragma mark-退出登录
-(void)addTuichuBtn
{
    UIButton*btn=[UIButton getAppCommonWhiteBackBtn];
    [btn setImage:[UIImage imageNamed:@"tuichu"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tuichuClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}
-(void)addTuichu
{
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(0, 0, WINDOWW, 60);
    backView.backgroundColor=NatureColorNearlyWhite;
    {
    UIButton*btn1=[[UIButton alloc]initWithFrame:RECT(LeftMargin*2, 0, WINDOWW-LeftMargin*4, 40)];
    [btn1 cornerHG2];
    btn1.centerX=WINDOWW/2;
    btn1.centerY=backView.height/2;

    btn1.backgroundColor=BlackColor;
    [btn1 setTitleColor:WhiteColor forState:UIControlStateNormal];
    btn1.titleLabel.font=font(15);
    [btn1 setTitle:@"退出登录" forState:UIControlStateNormal];

    [btn1 addTarget:self action:@selector(tuichuClick) forControlEvents:UIControlEventTouchUpInside];

    [backView addSubview:btn1];
    }
    self.tableView.tableFooterView=backView;
}
-(void)tuichuClick
{
    [[NSNotificationCenter defaultCenter]postNotificationName:tuichuLoginNotiName object:nil];
}
#pragma mark-特殊数据处理
-(void)separateDataAndTitle:(NSDictionary*)resnfo
{
    NSDictionary*data=[resnfo objectForKey:@"data"];
    NSString*headertitles=[data objectForKey:@"title"];
    if (data==nil||headertitles==0) {
        [SVProgressHUD showErrorWithStatus:@"没有数据！"];
        return;
    }

    NSArray*titles=[headertitles componentsSeparatedByString:@","];

    [self.totalDatas removeAllObjects];
    if (titles.count) {
        NSMutableArray*datas=[[NSMutableArray alloc]init];
        for (NSString*str in titles) {
            [datas addObject:@{str:[data objectForKey:str]}];
        }
        [self.totalDatas addObject:datas];
    }


}
#pragma mark-特殊样式
-(void)addRightBtnJiaWithDefalutSelStr
{
    [self addRightBtnJiaWithSelStr:@"right_btnClick:"];
}
-(void)right_btnClick:(UIButton*)sender
{
        //    NSUInteger tag=sender.tag;
}
-(void)addRightBtnJiaWithSelStr:(NSString*)selstr
{
    [self addRightBtnJiaWithSmallImgStr:@"icon_jiahao" SelStr:selstr];
}
-(void)addRightBtnDefalutSelWithSmallImgStr:(NSString*)imgstr
{
    [self addRightBtnJiaWithSmallImgStr:imgstr SelStr:@"right_btnClick:"];
}

-(UIButton*)addRightBtnJiaWithSmallImgStr:(NSString*)imgstr SelStr:(NSString*)selstr
{
    CGFloat btnW=30;
    CGFloat btnH=30;
    UIButton*btn=[[UIButton alloc]initWithFrame:RECT(WINDOWW-btnW-LeftMargin, 0, btnW, btnH)];

    btn.centerY=NavBtnCenterY;
    [btn addSmallImg:imgstr w:19 h:19];

    [btn addTarget:self action:NSSelectorFromString(selstr) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:btn];
    return btn;


}
-(UIButton*)addRightSecondBtnJiaWithSmallImgStr:(NSString*)imgstr SelStr:(NSString*)selstr
{
    UIButton*btn=[self addRightBtnJiaWithSmallImgStr:imgstr SelStr:selstr];
    btn.left=btn.left-LeftMargin-btn.width;
    return btn;
}
-(UIButton*)addRightBtnSecondJiaWithSelStr:(NSString*)selstr btn:(UIButton*)jiaB imgStr:(NSString*)imgstr
{
    CGRect huodong_rect=cyFrameRightWH(jiaB.x-20, jiaB.centerY, jiaB.width, jiaB.height);
    UIButton*imgbtn=[[UIButton alloc]init];
    imgbtn.frame=huodong_rect;
    [imgbtn setImage:[UIImage imageNamed:imgstr] forState:UIControlStateNormal];
    [imgbtn addTarget:self action:NSSelectorFromString(selstr) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:imgbtn];
    return imgbtn;
}
#pragma mark-cell
-(void)zhuruCellType:(NSString*)key
{
    if (self.totalDatas.count==0) {
        return;
    }
    NSArray*data=self.totalDatas[0];
    if (!data) {
        if ([self.resnfo isKindOfClass:[NSDictionary class]]) {
            data=[self.resnfo objectForKey:@"data"];
        }
        else
            {
            data=(NSArray*)self.resnfo;
            }
    }
    NSMutableArray*datas=[[NSMutableArray alloc]init];
    for (NSDictionary*dic in data) {
        NSMutableDictionary*mudic=[[NSMutableDictionary alloc]init];
        [mudic setValuesForKeysWithDictionary:dic];
        [mudic setObject:key forKey:CommonCellTypekey];
        [datas addObject:mudic];
    }
    [self.totalDatas removeAllObjects];
    [self.totalDatas addObject:datas];
}
-(void)workNeedShowNoData
{
    NSUInteger count=self.totalDatas.count;
    if (count) {
        NSArray*arr=self.totalDatas[0];
        count=arr.count;
    }
    [self tableView:self.tableView DisplayWitMsg:@"没有数据" ifNecessaryForRowCount:count];
}
- (void)refreshNowDataWithDic:(NSDictionary*)dic
{
        //    NSMutableArray*muarr=[[NSMutableArray alloc]init];
        //    [muarr addObject:@[dic]];
        //    self.totalDatas=muarr;
    [self updateNowDataWithDic:dic];
    [self.tableView reloadData];
}
- (void)updateNowDataWithDic:(NSDictionary*)dic
{
    [self.totalDatas removeAllObjects];
    NSMutableArray*muarr=[[NSMutableArray alloc]init];
    [muarr addObject:dic];
    [self.totalDatas addObject:muarr];
}
#pragma mark-删除区
-(void)showRealDealWithKeyStr:(NSString*)keystr del_selStr:(NSString*)selStr
{
    NSString*message=[NSString stringWithFormat:@"确定删除%@吗?",keystr];
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"温馨提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    WS(weakSelf);
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf performSelector:NSSelectorFromString(selStr)];
        }
    ];
        [alertController addAction:action];
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        }
    ];
        [alertController addAction:action1];
    [alertController fullScreenWhenPresented];
    [self presentViewController:alertController animated:YES completion:nil];
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
