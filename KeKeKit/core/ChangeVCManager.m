    //
    //  ChangeVCManager.m
    //  FirstProject
    //
    //  Created by KeKe on 3018/9/19.
    //  Copyright © 3018年 awen. All rights reserved.
    //

#import "ChangeVCManager.h"
#define LoginVCName @"LoginVC"
#import "HZPhotoBrowser.h"
static ChangeVCManager*sharedChangeVCMa=nil;
@interface ChangeVCManager ()

@end

@implementation ChangeVCManager
+(ChangeVCManager*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedChangeVCMa=[[ChangeVCManager alloc]init];
    });
    return sharedChangeVCMa;
}
- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
}
+(void)showLogin
{
    AppDelegate*appdelegate=(AppDelegate*)[UIApplication sharedApplication].delegate;
   BOOL hasShowLogin=[objc_getAssociatedObject(appdelegate, CFBridgingRetain(@"hasShowLogin")) boolValue];
    if (hasShowLogin) {
        return;
    }
    objc_setAssociatedObject(appdelegate, @"hasShowLogin", @(hasShowLogin), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    dispatch_async(dispatch_get_main_queue(), ^{
        SuperOneVC*vc=(SuperOneVC*)[[NSClassFromString(LoginVCName) alloc]init];
        SEL asel=@selector(sharedVC);
        if ([ViewController respondsToSelector:asel]) {
            ViewController*avc=(ViewController*)[ViewController performSelector:asel];

            UIWindow*win =avc.view.window;
            UIViewController*rootvc= win.rootViewController;
            UINavigationController*navc=[[UINavigationController alloc]initWithRootViewController:vc];
            if (@available(iOS 13.0, *)) {
                      navc.modalPresentationStyle=UIModalPresentationFullScreen;
                   }
            navc.navigationBarHidden=YES;
            [rootvc presentViewController:navc animated:YES completion:nil];
        }

    });


}
+(void)receiveLogin
{
    AppDelegate*delegate= (AppDelegate*) [UIApplication sharedApplication].delegate;
    SEL asel=@selector(showMainPage);
    if ([delegate respondsToSelector:asel]) {
        [delegate performSelector:asel];
    }
}
+(void)navcwantPushUserInfoVC:(UINavigationController*)navc
{
        //    if([UserInfoManager isVisitAccount])
        //        {
        //        [ChangeVCManager showLogin];
        //        }
        //    else
        //        {
        ////        UserInfoVC*vc=[[UserInfoVC alloc]init];
        ////        [navc pushViewController:vc animated:YES];
        //        }
}



+(void)navc:(UINavigationController*)navc dealCycleImgInfo:(NSDictionary*)dic
{
    int linkType=[[dic objectForKey:@"linkType"]intValue];
    if (linkType==1) {//外部链接
        NSDictionary*info=[UrlsManager getUrlInfoWithKey:@"iSeeAd"];
        NSString*url=[info objectForKey:URLKeyName];
        NSString*adid=[[dic objectForKey:@"id"]stringValue];
        NSDictionary*paramters=@{@"id":adid};
        ChangeVCManager*cvcm=[ChangeVCManager sharedInstance];

        cvcm.no=[[NetObj alloc]initWithUrl:url parameters:paramters Block:^(NSDictionary *resnfo) {
            NSString*retCode=[resnfo objectForKey:@"retCode"];
            if ([retCode isEqualToString:@"1"]) {

            }
            else
                {
                [SVProgressHUD showErrorWithStatus:[resnfo objectForKey:@"retMsg"]];
                }
        }];
        [cvcm.no start];
        NSString*linkUrl=[dic objectForKey:@"linkUrl"];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:linkUrl]];
    }
    else if (linkType==2)
        {
        NSDictionary*moviedic=@{@"id":[dic objectForKey:@"id"],@"videoCover":[dic objectForKey:@"picUrl"],@"title":[dic objectForKey:@"linkTypeName"]};
        [ChangeVCManager navc:navc pushMovieDetailInfo:moviedic];
        }
    else if ( linkType==3)
        {//购买
            [self navcpushPurchase:navc];
        }else if ( linkType==4)
            {//邀请
                [self navcpushInvite:navc];
            }
        else if (linkType==5)
            {//标签结果
                NSArray*arr=nil;
                NSNumber*tid=[dic objectForKey:@"tagId"];
                if (tid) {
                    NSString*tname=[dic objectForKey:@"tagName"];
                    NSDictionary*dic=tid?@{@"id":tid,@"name":tname}:nil;
                    arr=@[dic];
                }
                [self navc:navc pushTagsResultInfo:arr];
            }
}
+(void)gotoPicsDetailShowWithDatas:(NSArray*)datas
{
    HZPhotoBrowser *browser = [[HZPhotoBrowser alloc] init];
    browser.isFullWidthForLandScape = YES;
    browser.isNeedLandscape = YES;
    browser.currentImageIndex = 0;
    browser.imageArray = datas;
    [browser show];
}
+(void)showFileWithDic:(NSDictionary*)dic
{
    NSString*fileName=[dic objectForKey:@"fileName"];
    NSString*fileUrl=[dic objectForKey:@"fileUrl"];
    if (![fileName isimg]) {
        FunctionDefaultVC*vc=[[FunctionDefaultVC alloc]initWithUrl:fileUrl];
        UINavigationController*navc=[self navc];
        [navc pushViewController:vc animated:YES];
    }
    else
        {
        [ChangeVCManager gotoPicsDetailShowWithDatas:[NSArray arrayWithObject:fileUrl]];
        }
}
+(UINavigationController*)navc
{
    SEL asel=@selector(sharedVC);
    if ([ViewController respondsToSelector:asel]) {
        ViewController*rootvc=(ViewController*)[ViewController performSelector:asel];
        SEL bsel=@selector(nowVC);
        if ([rootvc respondsToSelector:bsel]) {
            UINavigationController*navc=[rootvc performSelector:bsel];
            return navc;
        }

    }
    return nil;
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
