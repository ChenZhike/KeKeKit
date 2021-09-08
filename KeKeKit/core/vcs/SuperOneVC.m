//
//  SuperOneVC.m
//  KeKeKit
//
//  Created by KeKe on 2021/03/30.
//  Copyright © 2021年 KeKe. All rights reserved.
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
    if (self.father_dic&&self.idstr.length==0) {
           self.idstr=[[self.father_dic objectForKey:@"id"]numOrStringValue];
       }

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
        [self req_seqs];
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
        KeKeViewController*vc=(KeKeViewController*)self.navigationController.parentViewController;
        SEL asel=NSSelectorFromString(@"setBottomHide:who:");
        [vc performSelector:asel withObjects:@[@(NO),self]];

//        [vc setBottomHide:NO who:self];
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.fillDataTimeMode==FillDataTimeModeDidAppear) {
        [self.tableView.mj_header beginRefreshing];
    }

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.needDealHideBottom) {
        KeKeViewController*vc=(KeKeViewController*)self.navigationController.parentViewController;
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
    alab.textColor=self.top_light_style?WhiteColor:BlackColor;;
    alab.text=title;
    alab.textAlignment=NSTextAlignmentCenter;
    self.top_title_lab=alab;


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
    UIButton*btn=self.top_light_style==NO?[UIButton getAppCommonBackBtn]:[UIButton getAppCommonWhiteBackBtn];
    [self.topView addSubview:btn];
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
        UIView*backgroundView=nil;
        // 没有数据的时候，
        //如果是搜索，用搜索的
        NSString*class_name=NSStringFromClass([self class]);
        if ([[class_name lowercaseString] containsString:@"search"]) {
            backgroundView=[UIView getSearchEmptyView];
        }
        else
            {            //        其他的用UILabel的显示样式
            UILabel *messageLabel = [UILabel new];
            messageLabel.text = message;
            messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
            messageLabel.textColor = [UIColor lightGrayColor];
                //        label居中
            messageLabel.textAlignment = NSTextAlignmentCenter;
            [messageLabel sizeToFit];
            backgroundView=messageLabel;
            }
        tb.backgroundView = backgroundView;
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
- (void)req_seqs
{
[self fillSeq_RequWithSels:self.seq_urls parameters:self.seq_url_dics];
}
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
//            NSString*retCode=[resnfo objectForKey:@"retCode"];
//            BOOL is_ok=[globalc]
            if ([NetObj ok_return:resnfo]) {
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
    int index=[[resnfo objectForKey:NetObjTagKey]intValue];
    NSDictionary*data=[resnfo objectForKey:@"data"];
    [self.seq_req_datas replaceObjectAtIndex:index withObject:data];
    self.seq_reqs_successed_num++;
    if (self.seq_reqs_successed_num>=self.seq_urls.count) {
        [self performSelector:NSSelectorFromString(self.seq_request_total_deal_SelStr)];
    }
}
#pragma mark-一般点击事件处理
-(void)updateNowDataAndUI
{
    NSDictionary*click_data=self.click_data;
    if (click_data==nil) {
        NSDictionary*dic=self.change_data_muarr[self.change_data_index];
        NSMutableDictionary*mudic=[[NSMutableDictionary alloc]initWithDictionary:dic];
        [mudic setValuesForKeysWithDictionary:self.success_replace];
        click_data=mudic;
    }

    NSMutableArray*arr=self.change_data_muarr;
    [arr replaceObjectAtIndex:self.change_data_index withObject:click_data];
    if (self.change_UI_cells.count==0) {
        SuperOneTableViewCell*cell=self.change_UI_cell;
        [cell configWithData:click_data];
    }
    else
        {
        for (SuperOneTableViewCell*cell in self.change_UI_cells) {
            [cell configWithData:click_data];
        }
        }
    self.click_data=nil;

}
-(void)dealServerUpdateRequest:(NSDictionary*)resnfo
{
//    NSString*retCode=[resnfo objectForKey:@"retCode"];
    if ([NetObj ok_return:resnfo]) {
        [SVProgressHUD showSuccessWithStatus:[resnfo objectForKey:@"retMsg"]];
        if (self.success_replace) {
            [self updateNowDataAndUI];
        }
    }
    else
        {
        [SVProgressHUD showErrorWithStatus:[resnfo objectForKey:@"retMsg"]];
        }

}
- (void)setTableListRefreshMode
{
    self.change_data_muarr=self.totalDatas[self.click_indexPath.section];
    self.change_data_index=self.click_indexPath.row;
    SuperOneTableViewCell*cell=[self.tableView cellForRowAtIndexPath:self.click_indexPath];
    self.change_UI_cell=cell;
}
- (void)setTiJiaoBackWithUrl:(NSString*)url parameter:(NSDictionary*)parameter
{
       WS(weakSelf);
       NetObj*no=[[NetObj alloc]initWithUrl:url parameters:parameter Block:^(NSDictionary *resnfo) {
//           NSString*retCode=[resnfo objectForKey:@"retCode"];
           if ([NetObj ok_return:resnfo]) {
               [SVProgressHUD showSuccessWithStatus:[resnfo objectForKey:@"retMsg"]];
               [weakSelf wannengBack];
           }
           else
               {
               [SVProgressHUD showErrorWithStatus:[resnfo objectForKey:@"retMsg"]];
               }
       }];
       [no start];
       [self.nos addObject:no];
}
- (void)pushToVC:(NSString*)classstr
{
    SuperOneVC*vc=[[NSClassFromString(classstr) alloc]init];
    NSDictionary*child_dic=self.child_dic;
    if (child_dic) {
        vc.father_dic=child_dic;
    }
    UINavigationController*navc=self.navigationController;
    if (navc==nil) {
        navc=[ChangeVCManager navc];
    }
    [navc pushViewController:vc animated:YES];
}
#pragma mark-cell加载
- (SuperOneTableViewCell*)loadCellWithName:(NSString*)name data:(NSDictionary*)data
{
    SuperOneTableViewCell*cell=nil;
    NSArray*nibs=[[NSBundle mainBundle]loadNibNamed:name owner:nil options:nil];
    if (nibs.count) {
        cell=[nibs objectAtIndex:0];
    }
    else
        {
        cell=[[NSClassFromString(name) alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:name];
        }
    cell.frame=RECT(0, 0, WINDOWW, [NSClassFromString(name) suggestedHWithData:nil]);
    cell.actionDelegate=self;
    [cell configWithData:data];
    return cell;
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
    if (data==nil||headertitles.length==0) {
        [SVProgressHUD showErrorWithStatus:@"没有数据！"];
        return;
    }

    NSArray*titles=[headertitles componentsSeparatedByString:@","];

    [self.totalDatas removeAllObjects];
    if (titles.count) {
        NSMutableArray*datas=[[NSMutableArray alloc]init];
        for (NSString*str in titles) {
            if (str.length) {
                id obj=[data objectForKey:str];
                if (obj) {
                    [datas addObject:@{str:obj}];
                }
                        }

        }
        [self.totalDatas addObject:datas];
    }
}
-(void)removeNowClickIndexPathDataAndRefresh
{
    NSIndexPath*indexPath=self.click_indexPath;
    NSMutableArray*muarr=self.totalDatas[indexPath.section];
    [muarr removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationAutomatic)];
}
#pragma mark-特殊样式
- (void)updateTableY:(CGFloat)y
{
    self.tableView.frame=RECT(0, y, WINDOWW, WINDOWH-[self vc_bot_h]-y);
}
-(UIButton*)addRightBtnJiaWithDefalutSelStr
{
    return [self addRightBtnJiaWithSelStr:@"right_btnClick:"];
}
-(void)right_btnClick:(UIButton*)sender
{
        //    NSUInteger tag=sender.tag;
}
-(UIButton*)addRightBtnJiaWithSelStr:(NSString*)selstr
{
    return [self addRightBtnJiaWithSmallImgStr:@"icon_jiahao" SelStr:selstr];
}
-(UIButton*)addRightBtnDefalutSelWithSmallImgStr:(NSString*)imgstr
{
    return [self addRightBtnJiaWithSmallImgStr:imgstr SelStr:@"right_btnClick:"];
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
-(UIButton*)addRightBtnWithTitle:(NSString*)title SelStr:(NSString*)selstr
{
    CGFloat btnW=30;
    CGFloat btnH=30;
    UIButton*btn=[[UIButton alloc]initWithFrame:RECT(WINDOWW-btnW-16, 0, btnW, btnH)];

    btn.centerY=NavBtnCenterY;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:APPThemeColor forState:UIControlStateNormal];
    btn.titleLabel.font=font(13);

    [btn addTarget:self action:NSSelectorFromString(selstr) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:btn];

    return btn;

}
-(UIButton*)addRightBtnDefaultSelStrWithTitle:(NSString*)title
{
    return [self addRightBtnWithTitle:title SelStr:@"right_btnClick:"];
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
#pragma mark-内容顶部分割样式
-(void)updateContentTopStyle
{
    [self.content_top_view removeFromSuperview];
    if (self.contentTopSeperatorStyle!=ContentTopSeperatorStyleNone) {
        CGFloat h=0;
        UIColor*color=nil;
        if (self.contentTopSeperatorStyle==ContentTopSeperatorStyleLine) {
        h=0.5f;
        color=RGB(230, 230, 230, 1);
            }
        if (self.contentTopSeperatorStyle==ContentTopSeperatorStyle长方形) {
            h=10;
          color=[GlobalConst topviewBackColor];
           }
        UIView*backView=[[UIView alloc]initWithFrame:RECT(0, NavHeight, WINDOWW, h)];
        backView.backgroundColor=color;
        self.content_top_view=backView;
        [self.view addSubview:backView];
    }
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
#pragma mark-vc
- (void)addVC:(UIViewController*)vc
{
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
}
-(void)contentWithColor
{
    self.topView.backgroundColor=WhiteColor;
    self.view.backgroundColor=ViewBackColor;
    self.tableView.backgroundColor=[UIColor clearColor];
}
- (void)recevieSon:(SuperOneVC*)son data:(NSDictionary*)data
{

}
- (void)recevieSon:(SuperOneVC*)son datas:(NSArray*)datas
{

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
