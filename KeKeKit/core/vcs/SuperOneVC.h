    //
    //  SuperOneVC.h
    //  KeKeKit
    //
    //  Created by KeKe on 2021/03/30.
    //  Copyright © 2021年 KeKe. All rights reserved.
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
typedef NS_ENUM(NSUInteger,ContentTopSeperatorStyle)
{
ContentTopSeperatorStyleNone,
ContentTopSeperatorStyleLine,
ContentTopSeperatorStyle长方形
};
typedef NS_ENUM(NSUInteger,DataRefreshType)//目前就用在super(complex)topsecondVC
{
DataRefreshTypeLazy,//点击按钮不刷新，让手动刷新
DataRefreshTypeNow//点击按钮就刷新
};
NS_ASSUME_NONNULL_BEGIN
@interface SuperOneVC : UIViewController
#pragma mark-数据-服务器-请求池
@property(nonatomic,strong,nullable)NSMutableArray* nos;
    //网络请求数组区
- (void)configseq_urls;
- (void)req_seqs;
@property(nonatomic,strong,nullable)NSMutableArray* seq_urls;//顺序请求数组，
@property(nonatomic,strong,nullable)NSMutableArray* seq_url_dics;
@property(nonatomic,assign)int seq_reqs_successed_num;//该数组里请求成功累计,当seq_reqs_successed_num=seq_reqs。count时调用filltotaldatas方法。
@property(nonatomic,strong,nullable)NSMutableArray* seq_req_datas;//请求返回的数据数组
#pragma mark-数据-服务器-第一次数据请求-请求-token
@property(nonatomic,assign)BOOL seq_need_token;
@property(nonatomic,assign)BOOL data_need_token;
#pragma mark-数据-服务器-第一次数据请求-请求-method
@property(nonatomic,assign)BOOL is_request_body;
#pragma mark-数据-服务器-第一次数据请求-请求-分页
@property(nonatomic,assign)int current;
@property(nonatomic,assign)int size;
@property(nonatomic,assign)int pages;
@property(nonatomic,assign)int total;
#pragma mark-数据-服务器-第一次数据请求-返回
@property(nonatomic,strong,nullable)NSDictionary* resnfo;
@property(nonatomic,assign)BOOL needSeparateTitle;//需要分割标题
@property(nonatomic,copy,nullable)NSString*seq_request_total_deal_SelStr;
-(void)separateDataAndTitle:(NSDictionary*)resnfo;

#pragma mark-数据-服务器-第一次数据请求-刷新
@property(nonatomic,assign)DataRefreshType dataRefreshType;
@property(nonatomic,assign)BOOL prevent_refresh;
    //一般数据请求与tableview
@property(nonatomic,assign)BOOL data_prevent_refresh_header;
@property(nonatomic,strong,nullable)NSDictionary* olddic;
    //tablview刷新
@property(nonatomic,assign)BOOL refreshFoot;
- (void)refreshNowDataWithDic:(NSDictionary*)dic;
- (void)updateNowDataWithDic:(NSDictionary*)dic;
- (void)setTableListRefreshMode;
#pragma mark-数据-服务器-提交
@property(nonatomic,copy,nullable)NSString*tijiao_title;
#pragma mark-UI-top
@property(nonatomic,strong)UIView* topView;
@property(nonatomic,assign)BOOL top_light_style;
-(void)topViewAddLine;
-(void)fillTopview;
#pragma mark-UI-top-center
@property(nonatomic,strong)UILabel* top_title_lab;
-(void)topViewAddTitle:(NSString*)title;
#pragma mark-UI-top-left
-(void)addBackBtn;
-(void)wannengBack;
#pragma mark-UI-top-right
-(UIButton*)addRightSecondBtnJiaWithSmallImgStr:(NSString*)imgstr SelStr:(NSString*)selstr;
-(UIButton*)addRightBtnSecondJiaWithSelStr:(NSString*)selstr btn:(UIButton*)jiaB imgStr:(NSString*)imgstr;
-(UIButton*)addRightBtnJiaWithSelStr:(NSString*)selstr;
-(UIButton*)addRightBtnJiaWithDefalutSelStr;
-(UIButton*)addRightBtnJiaWithSmallImgStr:(NSString*)imgstr SelStr:(NSString*)selstr;
-(UIButton*)addRightBtnDefalutSelWithSmallImgStr:(NSString*)imgstr;
-(UIButton*)addRightBtnWithTitle:(NSString*)title SelStr:(NSString*)selstr;
-(UIButton*)addRightBtnDefaultSelStrWithTitle:(NSString*)title;
@property(nonatomic,assign)BOOL hideRight;
-(void)addTuichu;
-(void)addTuichuBtn;
#pragma mark-UI-content
-(void)contentWithColor;
#pragma mark-UI-content-top
@property(nonatomic,assign)ContentTopSeperatorStyle contentTopSeperatorStyle;
@property(nonatomic,strong,nullable)UIView* content_top_view;
#pragma mark-UI-content-tableView-UI
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,assign)FillDataTimeMode fillDataTimeMode;
- (void)updateTableY:(CGFloat)y;
-(void)updateContentTopStyle;
#pragma mark-UI-content-tableView-数据
@property(nonatomic,assign)NSInteger sectionsNum;
@property(nonatomic,strong)NSMutableArray* sectionTitles;
@property(nonatomic,strong)NSMutableArray* sectionDics;//和sectionTitles二选一

@property(nonatomic,strong)NSMutableArray* totalDatas;
@property(nonatomic,strong)NSMutableArray* perDataGroupNum;//每个分区的数据几个为一个UI单位。
-(NSString*)dequeuenameForRowAtIndexPath:(NSIndexPath *)indexPath;
-(NSObject*)dataForIndexPath:(NSIndexPath *)indexPath;
#pragma mark-UI-content-tableView--空数据UI
- (void)tableView:(UITableView*)tb DisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount;
#pragma mark-UI-content-tableView-cell-加载
- (SuperOneTableViewCell*)loadCellWithName:(NSString*)name  data:(NSDictionary*)data;
#pragma mark-UI-content-tableView-cell-删除并刷新
-(void)removeNowClickIndexPathDataAndRefresh;
#pragma mark-底部区-home
@property(nonatomic,assign)BOOL needDealHideBottom;
-(CGFloat)vc_bot_h; //底部留白区
#pragma mark-底部区-提交
-(UIView*)getTijiaoAreaView;
-(void)fillFoot;
- (void)setTiJiaoBackWithUrl:(NSString*)url parameter:(NSDictionary*)parameter;
#pragma mark-UI-底部区-tabbar
-(void)customViewWantShow;
#pragma mark-跳转-storyboard
@property(nonatomic,copy,nullable)NSString*segue_str;
#pragma mark-跳转-father
@property(nonatomic,assign)KeKeViewController* superVC;
@property(nonatomic,strong,nullable)NSDictionary* father_dic;
@property(nonatomic,copy,nullable)NSString*idstr;
#pragma mark-跳转-son
@property(nonatomic,strong,nullable)NSDictionary* child_dic;//生成子vc要设置的
#pragma mark-UI&data-all-数据填充UI
-(void)fillTotalDatas;
-(void)zhuruCellType:(NSString*)key;
-(void)workNeedShowNoData;

#pragma mark-数据-服务器-临时请求
@property(nonatomic,strong)NetObj* no;
#pragma mark-数据-服务器-临时请求-返回
-(void)dealServerUpdateRequest:(NSDictionary*)resnfo;
-(void)showRealDealWithKeyStr:(NSString*)keystr del_selStr:(NSString*)selStr;

#pragma mark-数据-服务器-临时请求-变更数据
@property(nonatomic,strong)NSMutableArray* change_data_muarr;
@property(nonatomic,assign)int change_data_index;
@property(nonatomic,strong)NSDictionary* change_data_success_dic;
#pragma mark-数据-服务器-临时请求-变更UI
@property(nonatomic,strong)SuperOneTableViewCell* change_UI_cell;
@property(nonatomic,strong)NSMutableArray* change_UI_cells;
#pragma mark-cell点击事件
@property(nonatomic,strong,nullable)NSIndexPath* click_indexPath;
@property(nonatomic,strong,nullable)NSDictionary* click_data;
@property(nonatomic,assign)int clickAction;
@property(nonatomic,strong,nullable)NSDictionary* success_replace;


#pragma mark-vc
- (void)addVC:(UIViewController*)vc;
- (void)pushToVC:(NSString*)classstr;

@end
NS_ASSUME_NONNULL_END
