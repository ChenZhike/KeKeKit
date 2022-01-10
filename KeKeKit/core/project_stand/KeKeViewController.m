//
//  ViewController.m
//  KeKeKit
//
//  Created by 陈志科 on 2020/10/7.
//

#import "KeKeViewController.h"
#import "CustomNavigationController.h"
#import "ADVC.h"
static KeKeViewController*sharedViewController=nil;
@interface KeKeViewController ()
@property(nonatomic,strong)NSMutableArray* btns;
@end

@implementation KeKeViewController

+(KeKeViewController*)sharedVC
{
    return sharedViewController;
}
//-(NSArray*)ivNames
//{
//    return @[@"未选－哼哼",@"选中－哼哼",@"未选－哈哈",@"选中－哈哈",@"未选－嘻嘻",@"选中－嘻嘻",@"未选－我的",@"选中－我的"];
//}
-(NSArray*)barnames
{
    return @[];
}
-(int)bar_count
{
    return [self barnames].count;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    sharedViewController=self;
    self.child_content_view=[[UIView alloc]initWithFrame:RECT(0, 0, WINDOWW, WINDOWH)];
    self.ad_view=[[UIView alloc]initWithFrame:RECT(0, 0, WINDOWW, WINDOWH)];
    [self.view addSubview:self.child_content_view];
    [self.view addSubview:self.ad_view];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveTuichuLogin) name:tuichuLoginNotiName object:nil];
    if (self.show_launch_ad) {
        [self initAD];
    }
    [self initContentUI];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)initAD
{
    ADVC*vc=[[ADVC alloc]init];
    [self addChildViewController:vc];
    [self.ad_view addSubview:vc.view];
}
-(void)initContentUI
{
    int logintype=[UserInfoManager getLoginType];
    self.logintype=logintype;
     [self clean];
     [self setChildVCs];
     [self bindChildVCs];
     [self addBottomBtnsAndRegisterClicks];
}
-(void)initUI
{
    [self clean];
    [self setChildVCs];
    [self bindChildVCs];
    [self addBottomBtnsAndRegisterClicks];
}
-(void)clean
{
    for (int i=[self bar_count]-1; i>=0; i--) {
        UIViewController*nowVC=self.vcs[i];
        CustomNavigationController*navc=(CustomNavigationController*)nowVC.navigationController;
        [navc.view removeFromSuperview];
        [navc removeFromParentViewController];
    }
}
-(void)setChildVCs
{
//NSMutableArray*muarr=[[NSMutableArray alloc]init];
//  HomeVC*vc0=[[HomeVC alloc]init];
//    ChannelVC*vc1=[[ChannelVC alloc]init];
//    FindVC*vc2=[[FindVC alloc]init];
//    MineVC*vc3=[[MineVC alloc]init];
//    [muarr addObject:vc0];
//    [muarr addObject:vc1];
//    [muarr addObject:vc2];
//    [muarr addObject:vc3];
//    self.vcs=muarr;
//        vc0.superVC=self;
//        vc1.superVC=self;
//        vc2.superVC=self;
//        vc3.superVC=self;
}
-(void)bindChildVCs
{
    for (int i=[self bar_count]-1; i>=0; i--) {
        UIViewController*nowVC=self.vcs[i];
        CustomNavigationController*navc=[[CustomNavigationController alloc]initWithRootViewController:nowVC];
        navc.navigationBarHidden=YES;
        [self addChildViewController:navc];
        [self.view addSubview:navc.view ];
    }
}
-(void)addBottomBtnsAndRegisterClicks
{
    NSArray*imgnames=self.ivNames;
    CGFloat imgW=24;
    CGFloat imgH=24;
    CGFloat btnwidth=WINDOWW/4;
    CGFloat btnheight=BottomViewH;
    self.btns=[[NSMutableArray alloc]init];
    UIView*bottomView=[[UIView alloc]init];
    CGFloat totalh=WINDOWH;
    CGFloat both=BottomViewH;
    bottomView.frame=RECT(0, totalh-both, WINDOWW, BottomViewH);
    for (int i=0; i<[self bar_count]; i++) {
        NSString*imgstr=imgnames[i];
        UIButton*btn=[[UIButton alloc]initWithFrame:RECT(btnwidth*i, 0, btnwidth, btnheight)];
        btn.backgroundColor=WhiteColor;
        UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, 7, imgW, imgH)];
        iv.centerX=btnwidth/2;
        iv.tag=1;
        UIImage*image=[UIImage imageNamed:imgstr];
        iv.image=image;
        [btn addSubview:iv];

        UIFont*font=font(12);
        UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(0, iv.bottom+5, btnwidth, font.pointSize)];
        alab.centerX=iv.centerX;
        alab.font=font;
        alab.textColor=GrayColor;
        alab.text=self.barnames[i];
        alab.textAlignment=NSTextAlignmentCenter;

        [btn addSubview:alab];

        btn.tag=i;
        [btn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:btn];
        [self.btns addObject:btn];

    }
    self.bottomView=bottomView;
    [self.view addSubview:bottomView];
//    [self bottomSelectIndex:3];
//    [self bottomSelectIndex:0];
}
-(void)bottomBtnClick:(UIButton*)sender
{
    [self bottomSelectIndex:(int)sender.tag];
}
-(void)bottomSelectIndex:(int)index
{
#warning 根据实际情况配置
    NSArray*need_token_indexs=@[@(2),@(3),@(4)];
        if ([need_token_indexs containsObject:@(index)]) {
            if ([UserInfoManager getToken].length==0) {
                [SVProgressHUD showErrorWithStatus:@"登录后才能开放"];
                [ChangeVCManager showLogin];
    //        [self bottomSelectIndex:0];
                return;
            }
        }
    UIButton*nowBtn=self.btns[index];
    for (UIButton*btn in self.btns) {
        UIImageView*iv=(UIImageView*)[btn subViewWithTag:1];
        NSString*imgstr=btn==nowBtn?(self.ivNames[btn.tag*2+1]):(self.ivNames[btn.tag*2]);
        iv.image=[UIImage imageNamed:imgstr];
    }
    UIViewController*nowVC=self.vcs[index];
    [self.view bringSubviewToFront:nowVC.navigationController.view];
    [self.bottomView removeFromSuperview];
    [self.view addSubview:self.bottomView];
    self.nowVC=nowVC.navigationController;
//    if ([nowVC isKindOfClass:[MineVC class]]) {
//        [nowVC viewDidAppear:NO];
//    }

}
-(void)setBottomHide:(BOOL)hide who:(UIViewController *)whovc
{

    KeKeAppDelegate*appde=(KeKeAppDelegate*)[UIApplication sharedApplication].delegate;
    if (appde.hasShowLogin) {
        return;
    }
   UIViewController*nowrootvc= self.nowVC.viewControllers[0];
    if (whovc!=nowrootvc) {
        return;
    }
    self.bottomView.hidden=hide;
}
#pragma mark-监听系统通知
- (void)receiveTuichuLogin
{
    [self initContentUI];
    [UserInfoManager setToken:nil];
    [ChangeVCManager showLogin];
}
-(void)receiveLoginNoti
{
    [self initContentUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden
{
    return    [[self nowVC]prefersStatusBarHidden];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [[self nowVC]preferredStatusBarStyle];
}


@end
