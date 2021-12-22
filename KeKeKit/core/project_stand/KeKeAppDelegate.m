//
//  AppDelegate.m
//  KeKeKit
//
//  Created by 陈志科 on 2020/10/7.
//

#import "KeKeAppDelegate.h"
#import "AlertWindow.h"
#import <AVFoundation/AVFoundation.h>
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import <objc/runtime.h>
#import "IQKeyboardManager.h"
@interface KeKeAppDelegate ()
@property(nonatomic,assign) BOOL shouldStopBg;
@property(nonatomic,strong)AVAudioPlayer * audioPlayer;
@property(nonatomic,assign)NSInteger optionNumber;
@property(nonatomic,assign)NSTimeInterval interViewTime;
@property(nonatomic,strong)AFNetworkReachabilityManager *manager;


@end

    /// <#Description#>
@implementation KeKeAppDelegate
@synthesize allowRotation,netWorkStatesCode;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.fromCode=@"官方渠道";
//    [self xianshiExit];


    [UserInfoManager loadToken];
    [UserInfoManager loadLoginType];


//    self.launchOptions=launchOptions;
    [self networkReability];
    // Override point for customization after application launch.
    return YES;
}
-(void)testHttp
{
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];//此处修改为自己公司的服务器地址
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"%@",dict);
        }
    }];

    [dataTask resume];
}
//time str @"yyyy-MM-dd HH:mm:ss"
-(void)xianshiExit:(NSString* )timestr
{
    NSDate*date1= getCurrentTimeZone_Date();
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    [formate setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *formateString = @"yyyy-MM-dd HH:mm:ss";
    [formate setDateFormat:formateString ];
    NSDate*date=[formate dateFromString:@"2019-03-20 23:59:00"];
    if ([date compare:date1]==NSOrderedAscending) {
        [SVProgressHUD showErrorWithStatus:@"体验时间已到！"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            exit(0);
        });

    }
}
#pragma mark - 检测网络状态变化
-(UIButton*)retrybtn
{
    if (_retrybtn==nil) {
            //初始化方法
        UIButton*btn=[[UIButton alloc]initWithFrame:RECT(0, 0, 60, 30)];
            //btn.centerY=NavBtnCenterY;
        btn.center=CGPointMake(WINDOWW/2, NavHeight+88);
        [btn setTitle:@"重试" forState:UIControlStateNormal];
        [btn setTitleColor:BlackColor forState:UIControlStateNormal];
        [btn corner:3.6];
        [btn borderColr:BlackColor width:1];
        [btn addTarget:self action:@selector(retryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _retrybtn=btn;
    }
    return _retrybtn;
}
    //网络监听
- (void)showRetryBtn
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.retrybtn.superview==nil) {
            [self.window addSubview:self.retrybtn];
        }
        else
            {
            [self.window bringSubviewToFront:self.retrybtn];
            }
    });

}
- (void)hideRetryBtn
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.retrybtn removeFromSuperview];
    });

}
-(void)retryBtnClick:(UIButton*)sender
{
    AFNetworkReachabilityStatus status=[AFNetworkReachabilityManager manager].networkReachabilityStatus;
    if (status==AFNetworkReachabilityStatusReachableViaWiFi||status==AFNetworkReachabilityStatusReachableViaWWAN) {
        [self startAll];
        [self hideRetryBtn];
    }
    else
        {
        showErrorMsg(@"请确认您的网络连接！");
        [self testHttp];
        }
}
-(void)networkReability
{
    AFNetworkReachabilityManager*manager=[AFNetworkReachabilityManager sharedManager];
    self.manager=manager;


        //监听网络状态的改变
    WS(weakSelf);
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
            NSLog(@"变成了未知网络状态");
            [weakSelf testHttp];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
            NSLog(@"断网了");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
            NSLog(@"当前使用的是流量模式");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
            NSLog(@"当前使用的是wifi模式");
            }
                break;

            default:
                break;
        }
            //如果有网，继续请求
        BOOL youwang=(status==AFNetworkReachabilityStatusReachableViaWiFi||status==AFNetworkReachabilityStatusReachableViaWWAN);
        if (youwang)
            {
                //隐藏重试按钮
            [self hideRetryBtn];
                //如果之前没加载过，加载下
            if (self.loaded==NO) {
                self.loaded=YES;
                [self startAll];
            }
            }
        else
            {    //如果没网，显示重试按钮，点击重试后重新请求
                showErrorMsg(@"请确认您的网络连接！");
                [self showRetryBtn];
            }


        [[NSNotificationCenter defaultCenter]postNotificationName:@"netWorkChangeEventNotification" object:@(status)];
    }];
    [manager startMonitoring];
}
-(void)startAll
{
//    [self initUMeng];


//    NSString* deviceID =  [UMConfigure deviceIDForIntegration];
//    if ([deviceID isKindOfClass:[NSString class]]) {
//        NSLog(@"服务器端成功返回deviceID");
//    }
//    else{
//        NSLog(@"服务器端还没有返回deviceID");
//    }

//    [self configUMPush:self.launchOptions];
        //打开键盘开关
    [IQKeyboardManager sharedManager ].enable = YES;

    [UserInfoManager loadToken];
    [UserInfoManager loadLoginType];


//    [self firstBusinessRequest];

}
//-(void)netWorkChangeEvent
//{
//    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
//    NSURL *url = [NSURL URLWithString:@"http://baidu.com"];
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
//    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        self.netWorkStatesCode = status;
//        switch (status) {
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//            {
//            NSLog(@"当前使用的是流量模式");
//
//            }
//
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//            {
//            NSLog(@"当前使用的是wifi模式");
//            }
//
//                break;
//            case AFNetworkReachabilityStatusNotReachable:
//
//            {
//            NSLog(@"断网了");
//            }
//
//                break;
//                break;
//            case AFNetworkReachabilityStatusUnknown:
//            {
//            NSLog(@"变成了未知网络状态");
//            [self testHttp];
//
//            }
//
//                break;
//
//            default:
//                break;
//        }
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"netWorkChangeEventNotification" object:@(status)];
//    }];
//    [manager.reachabilityManager startMonitoring];
//}


-(void)justWantDisappear:(UIWindow*)oldwin
{
    self.window=oldwin;
    [self.window makeKeyAndVisible];
}
#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
