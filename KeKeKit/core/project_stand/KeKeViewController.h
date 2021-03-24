//
//  ViewController.h
//  KeKeKit
//
//  Created by 陈志科 on 2020/10/7.
//

#import <UIKit/UIKit.h>

@interface KeKeViewController : UIViewController
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

