//
//  ShareManager.m
//   BaobaoZhidao
//
//  Created by KeKe on 3018/8/24.
//  Copyright © 3018年 Dushu Ou. All rights reserved.
//

#import "ShareManager.h"
static ShareManager*onlyInstance=nil;
@interface ShareManager()<UIAlertViewDelegate>
@end
@implementation ShareManager
+(void)start
{
    getCurrentTime();
    if (onlyInstance==nil) {
        onlyInstance=[[ShareManager alloc]init];
    }
    [onlyInstance start];

}
-(void)start
{
  NSString*installtime =  [[NSUserDefaults standardUserDefaults]stringForKey:@"installTime"];
    if (!installtime) {
        [[NSUserDefaults standardUserDefaults]setObject:getCurrentTime() forKey:@"installTime"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return;
    }
    else
        {
        NSString*laststr= [[NSUserDefaults standardUserDefaults]objectForKey:@"lastShowTime"];
        NSDateFormatter*df=[[NSDateFormatter alloc]init];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate*installdate= [df dateFromString:installtime];
        NSDate*date=[NSDate date];
        if (!laststr) {//第一次展示
                NSTimeInterval timeinterval= [date timeIntervalSinceDate:installdate];
            if (timeinterval<24*3*3600) {//三天内不管
                return;
            }else
                {
                [[NSUserDefaults standardUserDefaults]setObject:getCurrentTime() forKey:@"lastShowTime"];
                }
        }
        else
        {
                NSDate*lastdate= [df dateFromString:laststr];
           NSTimeInterval timeinterval= [date timeIntervalSinceDate:lastdate];

            if (timeinterval<24*7*3600)
            {//七天内不管
                return;
            }else
            {
            [[NSUserDefaults standardUserDefaults]setObject:getCurrentTime() forKey:@"lastShowTime"];
            }
        }
        }


    UIAlertView*av=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"喜欢这个app吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"赞一下",@"联系作者", nil];
    [av show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 1://赞一下
        {
        NSString*appid=[GlobalConst sharedInstance].appid;
        NSString*appurl=APPDownloadUrlWithAPPID(appid);
        [[UIPasteboard generalPasteboard] setString:appurl];
        [SVProgressHUD showSuccessWithStatus:@"链接已复制到剪切板，请粘贴！"];
        }
            break;
        case 2://联系作者
        {
        NSString*email=[GlobalConst sharedInstance].author_email;
        [[UIPasteboard generalPasteboard] setString:email];
        [SVProgressHUD showSuccessWithStatus:@"恭喜您获得作者邮箱，有任何意见都可以邮件告知作者，请粘贴！"];
        }
            break;

        default:
            break;
    }
}
@end
