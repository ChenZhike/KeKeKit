//
//  GuideVC.m
//  KeKeKit
//
//  Created by CZK on 2019/6/2.
//  Copyright © 2019 czk. All rights reserved.
//

#import "GuideVC.h"

@interface GuideVC ()
@property(nonatomic,strong)NSArray*labs;
@property(nonatomic,strong)NSArray*vies;
@end

@implementation GuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.enterB borderColr:APPRedColor width:1];
    [self.enterB corner:3.6];



    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSArray*labs=[NSArray arrayWithObjects:self.lab1,self.lab2,self.lab3,self.lab4,self.lab5, nil];
    self.labs=labs;
    NSMutableArray*vies=[[NSMutableArray alloc]init];
    for (int i=0; i<labs.count; i++) {
        UILabel*lab=labs[i];
        UIView*vie=[[UIView alloc]initWithFrame:lab.frame];
        vie.tag=1;
        vie.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:vie];
//        [lab addSubview:vie];
        [vies addObject:vie];

    }
    self.vies=vies;
    self.enterB.y=WINDOWH;
    [self startLabAnimate];
}
-(void)startLabAnimate
{
    UILabel*lab=self.labs[self.current_ani_lab_index];
    lab.hidden=NO;
    UIView*vie=self.vies[self.current_ani_lab_index];
   __block CGFloat right=vie.right;

   [ UIView animateWithDuration:3.6 animations:^{
        vie.x=WINDOWW;
    } completion:^(BOOL finished) {
        if (finished) {
            self.current_ani_lab_index++;
            if (self.current_ani_lab_index<self.labs.count) {
                [self startLabAnimate];
            }else if (self.current_ani_lab_index==self.labs.count)
                {
                [self enterAnimate];
                }
        }


    }];
//    [UIView commitAnimations];
}
-(void)enterAnimate
{
    self.enterB.hidden=NO;
    [UIView animateWithDuration:2 animations:^{
        self.enterB.y=WINDOWH-self.enterB.height-60;
    } completion:nil];
//    [UIView commitAnimations];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)gotoMain:(id)sender {
    [InfoHelper setOnceFlagName:shownguide];
    [[NSNotificationCenter defaultCenter]postNotificationName:closeguidenotiname object:nil];
}
@end
