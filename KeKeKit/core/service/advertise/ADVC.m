//
//  ADVC.m
//  KeKeKit
//
//  Created by KeKe on 3018/10/6.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import "ADVC.h"

@interface ADVC ()

@end

@implementation ADVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=RECT(0, 0, WINDOWW, WINDOWH);
    self.changeB.layer.cornerRadius=6;
    self.changeB.clipsToBounds=YES;
//    self.changeB.layer.borderWidth=1;
//    self.changeB.layer.borderColor=[UIColor blackColor].CGColor;
    if (self.bannerList.count) {
        self.nowDic=self.bannerList[arc4random()%self.bannerList.count];
    }


    self.nowNum=5;

    NSString*picUrl=[self.nowDic objectForKey:@"picUrl"];
    [self.adIV setWithImgstr:picUrl];

    self.changeB.userInteractionEnabled=NO;
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1.2 target:self selector:@selector(changeBtnText) userInfo:nil repeats:YES];
    [self.timer fire];
    // Do any additional setup after loading the view from its nib.
}
- (void)changeBtnText
{



    if (self.nowNum==0) {
        [self.timer invalidate];
        self.timer=nil;
        self.changeB.userInteractionEnabled=YES;
            [self.changeB setTitle:@"跳转" forState:UIControlStateNormal];
    }
    else
        {
            [self.changeB setTitle:[NSString stringWithFormat:@"%d",self.nowNum] forState:UIControlStateNormal];
        }
        self.nowNum--;
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

- (IBAction)backBtnClick:(id)sender {
    KeKeAppDelegate*appdelegate=(KeKeAppDelegate*)[UIApplication sharedApplication].delegate;
    UIWindow*win=appdelegate.window?appdelegate.window:[UIApplication sharedApplication].keyWindow;
    KeKeViewController*vc=(KeKeViewController*)win.rootViewController;
    UINavigationController*navc=vc.nowVC;
    [ChangeVCManager navc:navc dealCycleImgInfo:self.nowDic];
}

- (IBAction)changeBtnClick:(id)sender {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}
@end
