//
//  AppDelegate.h
//  KeKeKit
//
//  Created by 陈志科 on 2020/10/7.
//

#import <UIKit/UIKit.h>
#import "NetObj.h"
@interface KeKeAppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic,assign)BOOL hasShowLogin;//是否已经展示登录弹窗
@property(nonatomic,copy) NSString* fromCode;


@property(nonatomic,strong)NSDictionary* resnfo;
@property (strong, nonatomic) UIWindow *window;



/*
 决定是不是可以允许转屏的参数
 */
@property(nonatomic,assign)BOOL allowRotation;

/*
 当前的网络状态
 */
@property(nonatomic,assign)int netWorkStatesCode;

/*
 当前的网络状态
 */
@property(nonatomic,strong,nullable)UIButton* retrybtn;
@property(atomic,assign)BOOL loaded;


-(void)showMainPage;
-(void)justWantDisappear:(UIWindow*)oldwin;
@end

