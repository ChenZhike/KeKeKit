//
//  GuideScrollVCViewController.m
//  FirstProject
//
//  Created by CZK on 2019/8/18.
//  Copyright © 2019 czk. All rights reserved.
//

#import "GuideScrollVCViewController.h"
#import "MyPageControl.h"
@interface GuideScrollVCViewController ()<UIScrollViewDelegate>

@end

@implementation GuideScrollVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self initContentSC];
    [self fillvies];
    [self initPG];
    // Do any additional setup after loading the view.
}
-(void)initContentSC
{
    UIScrollView*contentSC=[[UIScrollView alloc]initWithFrame:RECT(0,0 , WINDOWW, WINDOWH)];
    contentSC.delegate=self;
    contentSC.pagingEnabled=YES;
    contentSC.bounces=NO;
    [self.view addSubview:contentSC];
    if (@available(iOS 11.0, *)) {
        contentSC.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.sc=contentSC;
}
-(NSArray*)ivs
{
    return @[@"guide_beijing1",@"guide_beijing2",@"guide_beijing3"];
}
-(NSArray*)titles
{
    return @[@"让绘画成为孩子的艺术语言",@"让孩子的自信在生活中开花",@"让孩子画出自己眼里的世界"];
}
-(void)fillvies
{
    UIScrollView*sc=self.sc;
    NSMutableArray*views=[[NSMutableArray alloc]init];
    NSArray*ivs=[self ivs];
        NSArray*titles=[self titles];
    LabelStyle*ls=[self ls];
    for (int i=0; i<ivs.count; i++) {
        UIView*backView=[[UIView alloc]init];
        backView.frame=RECT(WINDOWW*i, 0, WINDOWW, WINDOWH);
        backView.backgroundColor=[UIColor whiteColor];
        {
        NSString*imgstr=ivs[i];
        UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, [self imgY], WINDOWW, WINDOWW*540/640)];
        UIImage*image=[UIImage imageNamed:imgstr];
        iv.image=image;
        iv.backgroundColor=RandomColor;

        [backView addSubview:iv];
        }
        {
        UIView*fatherView=backView;

        UIFont*font=ls.font;
        UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(0, [self labY], WINDOWW, font.pointSize)];
        alab.font=font;
        alab.textColor=ls.textColor;
        alab.text=titles[i];
        alab.textAlignment=ls.textAlignment;

        [fatherView addSubview:alab];
        }

        if (i==titles.count-1) 
        {
        UIButton*btn=[[UIButton alloc]initWithFrame:RECT(0, [self cancelBtnY], 108, 29.8)];
        btn.centerX=WINDOWW/2;
        [btn setTitle:@"点击进入" forState:UIControlStateNormal];
        [btn setTitleColor:WhiteColor forState:UIControlStateNormal];
        btn.titleLabel.font=font(12);
        btn.backgroundColor=BlackColor;
        [btn cornerHG2];
        [btn addTarget:self action:@selector(gotoMain:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:btn];
        }
        [sc addSubview:backView];
        [views addObject:backView];
    }
    self.vies=views;
    sc.contentSize=CGSizeMake(WINDOWW*views.count, sc.height);
}
-(CGFloat)imgY
{
    return kStatusBarHeight+66.0/667*WINDOWH;
}
-(CGFloat)spaceH
{
    return 60.0/1334*WINDOWH;
}
-(CGFloat)labY
{
    CGFloat y=[self imgY]+WINDOWW+[self spaceH];
    return y;
}
-(CGFloat)pgY
{
    return [self labY]+[self ls].font.pointSize+[self spaceH];
}
-(CGFloat)pcH
{
    return 20;
}
-(CGFloat)cancelBtnY
{
    return [self pgY]+[self pcH]+[self spaceH];
}
-(LabelStyle*)ls
{
    LabelStyle*ls=[[LabelStyle alloc]init];
    ls.font=font(15);
    ls.textColor=BlackColor;
    ls.textAlignment=NSTextAlignmentCenter;
    return ls;
}
-(void)initPG
{
    MyPageControl*pc=[[MyPageControl alloc]init];
    pc.frame=RECT(0, [self pgY], WINDOWW,[self pcH]);
    pc.numberOfPages=[self titles].count;
    pc.backgroundColor=[UIColor clearColor];
    pc.currentPageIndicatorTintColor=BlackColor;
    pc.pageIndicatorTintColor=RGB(230, 230, 230, 1);
    [self.view addSubview:pc];
    self.pc=pc;
//mypagecon
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat nowX=scrollView.contentOffset.x;
    int index=nowX/WINDOWW;
    self.pc.currentPage=index;
}
- (void)gotoMain:(id)sender {
    [InfoHelper setOnceFlagName:shownguide];
    [[NSNotificationCenter defaultCenter]postNotificationName:closeguidenotiname object:nil];
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
