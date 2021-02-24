//
//  FunctionDefaultVC.m
//  JinZi
//
//  Created by CZK on 16/1/13.
//  Copyright © 2016年 fengjinbiao. All rights reserved.
//

#import "FunctionDefaultVC.h"

@interface FunctionDefaultVC ()<UIWebViewDelegate>
{
    UIWebView*webVie;
    UILabel*wangluolab;
    NSString*lastRequestStr;//上次请求的url，因为webview在网络不佳时存储的request不正确。
}
@property(nonatomic,copy)NSString*imgName;
@property(nonatomic,copy)NSString*urlStr;
@end

@implementation FunctionDefaultVC
-(id)initWithUrl:(NSString *)aurlstr
{
    if (self=[super init]) {
        self.urlStr=aurlstr;
    }
    return self;
}
-(id)initWithImageName:(NSString*)imgName
{
    if (self=[super init]) {
        self.imgName=imgName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillTopView];
    [self.tableView removeFromSuperview];
    self.tableView=nil;
    [self initIV];
    [self initWebVie];
    if (self.isProtol) {
        [self initBotArea];
    }
    // Do any additional setup after loading the view.
}
#pragma mark-待子类覆盖区域
-(void)fillTotalDatas
{
        //按栏目顺序设置self.totalDatas
}
-(void)fillPerDataGroupNum
{
        //按栏目顺序设置每个分区几条数据为一组。
    self.perDataGroupNum=[NSMutableArray arrayWithObjects:@"1", nil];
}
-(void)fillTopView
{
    [self topViewAddTitle:self.title];


    if (!self.isProtol) {
        UIButton*btn=[UIButton getAppCommonBackBtn];
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(wannengBack) forControlEvents:UIControlEventTouchUpInside];
    }
    [self topViewAddLine];
}
-(void)registerCells
{

}
-(CGFloat)heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (nullable UIView *)viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

-(NSString*)dequeuenameForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"";
}
-(Class)cellClassForIndexPath:(NSIndexPath *)indexPath
{

    return [SuperOneTableViewCell class];
}
-(CGFloat)heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
-(UIView*)viewForFooterInSection:(NSInteger)section
{
    UIView*footview= [[UIView alloc]initWithFrame:RECT(0, 0, WINDOWW, 0.1)];
    footview.backgroundColor=[UIColor clearColor];
    return footview;
}
-(void)SuperOneTableViewCell:(SuperOneTableViewCell *)cell clickAction:(int)index
{

}
#pragma mark-按钮专区
-(void)wannengBack
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
        {
        [self dismissViewControllerAnimated:YES completion:nil];
        }
}
-(void)initIV
{
    if (self.imgName!=nil) {
        CGFloat ivY=NavHeight;
        UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, ivY, WINDOWW, WINDOWH-ivY)];
        iv.image=[UIImage imageNamed:self.imgName];
        iv.contentMode=UIViewContentModeScaleAspectFill;
        iv.clipsToBounds=YES;
        [self.view addSubview:iv];
    }
}
-(void)initWebVie
{
    if (self.urlStr!=nil) {
        webVie=[[UIWebView alloc]initWithFrame:RECT(0, NavHeight, WINDOWW, WINDOWH-NavHeight-kHomeBarHeight-(self.isProtol?66:0))];
        webVie.delegate=self;
        webVie.scalesPageToFit=YES;
        NSURL*url=[NSURL URLWithString:self.urlStr];
        if (self.isLocalFile==YES) {
            url=[NSURL fileURLWithPath:self.urlStr];
        }
        if (self.specialCode) {
            NSStringEncoding enc =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            NSString*htmlstr=[[NSString alloc]initWithContentsOfURL:url encoding:enc error:nil];
            [webVie loadHTMLString:htmlstr baseURL:url];
        }
        else
            {
            [webVie loadRequest:[NSURLRequest requestWithURL:url]];
            }



//
        if (!self.loadedReadyBeforeShow) {
            [self.view addSubview:webVie];
        }

    }
}
#pragma mark-webview代理专区
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    LOG(@"REQUEST:%@",request.URL.absoluteString);
    showMsg(@"加载中...");
    lastRequestStr=request.URL.absoluteString;
//    showNetworkRequestingStatus();
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
//    desMsg();
//    hideNetworkRequestingStatus();
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    desMsg();
    if (self.finished_jsstr.length) {
      NSString*resultstr=  [webView stringByEvaluatingJavaScriptFromString:self.finished_jsstr];
        NSLog(@"resultstr:%@",resultstr);
    }
//    NSString* lJs = @"document.getElementsByTagName('html')[0].innerHTML";
//    NSString* lHtml1 = [webView stringByEvaluatingJavaScriptFromString:lJs];
    if (self.loadedReadyBeforeShow) {
        [webView removeFromSuperview];
        [self.view addSubview:webVie];
    }
     //禁用用户选择
//    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
//
//
//    //禁用长按弹出框
//    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if (webView.request.URL.absoluteString.length!=0) {
        showErrorMsg(@"加载失败");
    }
    else
    {
        desMsg();
        UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 140, 30)];
        alab.text=@"亲，网络不给力哦";
        alab.textAlignment=NSTextAlignmentCenter;
        
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        btn.center=CGPointMake(WINDOWW/2, WINDOWH/2);
        [btn setBackgroundImage:[UIImage imageNamed:@"刷新"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(refreshClick:) forControlEvents:UIControlEventTouchUpInside];
        alab.center=CGPointMake(WINDOWW/2, WINDOWH/2-(btn.frame.size.height/2)-(alab.frame.size.height/2));
        [self.view addSubview:alab];
        wangluolab=alab;
        [self.view addSubview:btn];
    }
    
}
#pragma mark-事件处理专区

-(void)handleLeft
{
//    hideNetworkRequestingStatus();
    if (self.isPresent) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
    [self.navigationController popViewControllerAnimated:YES];
    }

}
#pragma mark-断网处理区域
-(void)refreshClick:(UIButton*)btn
{
    btn.userInteractionEnabled=false;
    [btn removeFromSuperview];
    [wangluolab removeFromSuperview];
    showMsg(@"页面加载中...");
    NSString*newstr=webVie.request.URL.absoluteString;
    if (newstr&&newstr.length>0&&(![newstr isEqualToString:@"about:blank"])) {
        lastRequestStr=newstr;
    }
    [webVie loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:lastRequestStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30]];
    showMsg(@"页面加载中...");
}
#pragma mark-协议底部区域
-(void)initBotArea
{
    UIView*botview=
    [[UIView alloc]initWithFrame:RECT(0, WINDOWH-kHomeBarHeight-66, WINDOWW, 66)];
    [botview addLineAtTopOrBottom:NO];

    UIButton*btn=[[UIButton alloc]initWithFrame:RECT(66, 15, 56, 36)];
    [btn cyHalf:botview];
    [btn borderColr:APPRedColor width:1];
    [btn corner:6.5];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTitleColor:APPRedColor forState:UIControlStateNormal];
    btn.titleLabel.font=font(16.5f);
    [btn addTarget:self action:@selector(cancelProtolClick) forControlEvents:UIControlEventTouchUpInside];
    [botview addSubview:btn];

    {
    UIButton*btn=[[UIButton alloc]initWithFrame:RECT(WINDOWW-66-36, 15, 56, 36)];
    [btn cyHalf:botview];
    [btn borderColr:APPBlueColor width:1];
    [btn corner:6.5];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn setTitleColor:APPBlueColor forState:UIControlStateNormal];
    btn.titleLabel.font=font(16.5f);
    [btn addTarget:self action:@selector(agreeProtolClick) forControlEvents:UIControlEventTouchUpInside];
    [botview addSubview:btn];
    }
    [self.view addSubview:botview];
}
-(void)cancelProtolClick
{
    [self.lastVC setValue:@"0" forKey:@"hasAgree"];
    showInfoMsg(@"您将不能发表内容！");
    [[NSNotificationCenter defaultCenter]postNotificationName:closeProtoclnotiname object:@"0"];

    [self wannengBack];
}
-(void)agreeProtolClick
{
    [self.lastVC setValue:@"1" forKey:@"hasAgree"];
    [[NSNotificationCenter defaultCenter]postNotificationName:closeProtoclnotiname object:@"1"];
    [self wannengBack];
        //    [self wannengBack];
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
