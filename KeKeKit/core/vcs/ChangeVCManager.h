    //
    //  ChangeVCManager.h
    //  KeKeKit
    //
    //  Created by KeKe on 3018/9/19.
    //  Copyright © 2021年 KeKe. All rights reserved.
    //

#import <UIKit/UIKit.h>

@interface ChangeVCManager : UIViewController
@property(nonatomic,strong)NetObj* no;
+(void)showLogin;
+(void)receiveLogin;
+(void)navcwantPushUserInfoVC:(UINavigationController*)navc;
+(void)navcpushInvite:(UINavigationController*)navc;
+(void)navcpushPurchase:(UINavigationController*)navc;
+(void)navc:(UINavigationController*)navc pushMovieDetailInfo:(NSDictionary*)detailInfo;
+(void)navc:(UINavigationController*)navc pushTagsResultInfo:(NSArray*)selectedtags;
+(void)navc:(UINavigationController*)navc dealCycleImgInfo:(NSDictionary*)info;
+(void)gotoPicsDetailShowWithDatas:(NSArray*)datas;
+(void)showFileWithDic:(NSDictionary*)dic;
+(UINavigationController*)navc;
@end
