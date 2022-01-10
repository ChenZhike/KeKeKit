//
//  ViewController.h
//  KeKeKit
//
//  Created by 陈志科 on 2020/10/7.
//

#import <UIKit/UIKit.h>

@interface KeKeViewController : UIViewController
@property(nonatomic,strong,nullable)NSArray* ivNames;//底部tabbar的图片名称，依次是tab0-未选中，tab0-选中，tab1-未选中，tab1-选中……
@property(nonatomic,assign)BOOL show_launch_ad;//展示启动广告
@property(nonatomic,strong,nullable)UIView* child_content_view;
@property(nonatomic,strong,nullable)UIView* ad_view;
@property(nonatomic,strong)UIView* bottomView;
@property(nonatomic,strong)UINavigationController* nowVC;
@property(nonatomic,strong)NSMutableArray* vcs;

#pragma mark-登录
@property(nonatomic,assign)int  logintype;
-(void)bottomSelectIndex:(int)index;
-(void)setBottomHide:(BOOL)hide who:(UIViewController*)whovc;
-(void)receiveLoginNoti;
-(void)initUI;
+(KeKeViewController*)sharedVC;
@end

