    //
    //  SuperOneVC.h
    //  FirstProject
    //
    //  Created by KeKe on 3018/9/14.
    //  Copyright © 3018年 awen. All rights reserved.
    //

#import <UIKit/UIKit.h>
#import "KeKeViewController.h"
typedef NS_ENUM(NSUInteger,FillDataTimeMode)
{
    FillDataTimeModeDidLoad,
    FillDataTimeModeWillAppear,
    FillDataTimeModeDidAppear,
    FillDataTimeModeKnown
};
@interface SuperOneVC : UIViewController

@property(nonatomic,copy,nullable)NSString*segue_str;
@property(nonatomic,copy,nullable)NSString*tijiao_title;

@property(nonatomic,assign)BOOL seq_need_token;
@property(nonatomic,assign)BOOL data_need_token;

@property(nonatomic,assign)BOOL prevent_refresh;
@property(nonatomic,strong,nullable)NSDictionary* olddic;
@property(nonatomic,strong)UIView* topView;
@property(nonatomic,strong,nullable)UILabel* titleLab;
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,assign)NSInteger sectionsNum;
@property(nonatomic,strong)NSMutableArray* sectionTitles;
@property(nonatomic,strong)NSMutableArray* sectionDics;//和sectionTitles二选一
@property(nonatomic,strong)NSMutableArray* totalDatas;
@property(nonatomic,strong)NSMutableArray* perDataGroupNum;//每个分区的数据几个为一个UI单位。




@property(nonatomic,strong)NetObj* no;

@property(nonatomic,strong,nullable)NSMutableArray* nos;

    //一般数据请求与tableview
    //一般数据请求
@property(nonatomic,assign)FillDataTimeMode fillDataTimeMode;
@property(nonatomic,copy,nullable)NSString*idstr;
@property(nonatomic,strong,nullable)NSDictionary* resnfo;


@property(nonatomic,assign)BOOL data_prevent_refresh_header;
@property(nonatomic,assign)BOOL is_request_body;
-(void)fillTotalDatas;

    //tablview刷新
@property(nonatomic,assign)BOOL refreshFoot;

    //服务器分页请求配置
@property(nonatomic,assign)int current;
@property(nonatomic,assign)int size;
@property(nonatomic,assign)int pages;
@property(nonatomic,assign)int total;


@property(nonatomic,assign)KeKeViewController* superVC;
@property(nonatomic,strong,nullable)NSDictionary* father_dic;


    //tableview常用方法
-(NSObject*)dataForIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView*)tb DisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount;

    //顶部底部区
@property(nonatomic,assign)BOOL needDealHideBottom;

    //顶部导航区
-(void)topViewAddTitle:(NSString*)title;
-(void)topViewAddLine;
-(void)addBackBtn;
-(void)wannengBack;
#pragma mark-底部按钮区
-(UIView*)getTijiaoAreaView;
    //底部留白区
-(CGFloat)vc_bot_h;


    //网络请求数组区
//- (void)configseq_urls;
@property(nonatomic,strong,nullable)NSMutableArray* seq_urls;//顺序请求数组，
@property(nonatomic,strong,nullable)NSMutableArray* seq_url_dics;
@property(nonatomic,assign)int seq_reqs_successed_num;//该数组里请求成功累计,当seq_reqs_successed_num=seq_reqs。count时调用filltotaldatas方法。
@property(nonatomic,strong,nullable)NSMutableArray* seq_req_datas;//请求返回的数据数组
@property(nonatomic,assign)BOOL needSeparateTitle;//需要分割标题
@property(nonatomic,copy,nullable)NSString*seq_request_total_deal_SelStr;
-(void)fillFoot;
-(void)customViewWantShow;

@property(nonatomic,assign)BOOL hideRight;
-(void)addTuichu;
-(void)addTuichuBtn;
-(void)separateDataAndTitle:(NSDictionary*)resnfo;

-(UIButton*)addRightSecondBtnJiaWithSmallImgStr:(NSString*)imgstr SelStr:(NSString*)selstr;
-(UIButton*)addRightBtnSecondJiaWithSelStr:(NSString*)selstr btn:(UIButton*)jiaB imgStr:(NSString*)imgstr;
-(void)addRightBtnJiaWithSelStr:(NSString*)selstr;
-(void)addRightBtnJiaWithDefalutSelStr;
-(UIButton*)addRightBtnJiaWithSmallImgStr:(NSString*)imgstr SelStr:(NSString*)selstr;
-(void)addRightBtnDefalutSelWithSmallImgStr:(NSString*)imgstr;
-(void)zhuruCellType:(NSString*)key;
-(void)workNeedShowNoData;
- (void)refreshNowDataWithDic:(NSDictionary*)dic;
- (void)updateNowDataWithDic:(NSDictionary*)dic;
-(void)wannengBack;
-(void)showRealDealWithKeyStr:(NSString*)keystr del_selStr:(NSString*)selStr;

@end
