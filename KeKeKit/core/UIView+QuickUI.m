    //
    //  UIView+QuickUI.m
    //  CZKFrameWork
    //
    //  Created by CZK on 2018/12/17.
    //  Copyright © 2018 czk. All rights reserved.
    //

#import "UIView+QuickUI.h"

NSString*const SizeSeprator=@"SizeSepratorSizeSepratorSizeSeprator";
@implementation UIView (QuickUI)
-(void)cornerHG2
{
    [self corner:self.height/2];
}
-(void)corner:(CGFloat)cornerRadius
{
    self.layer.cornerRadius=cornerRadius;
    self.clipsToBounds=YES;
}
-(void)borderColr:(UIColor*)color width:(CGFloat)width
{
    self.layer.borderColor=color.CGColor;
    self.layer.borderWidth=width;
}
-(void)addBackShadow
{
    CALayer *subLayer=[CALayer layer];
    CGRect fixframe = self.frame;
    subLayer.frame= fixframe;
    subLayer.cornerRadius=APPCorner;
    subLayer.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor;
    subLayer.masksToBounds=NO;
    subLayer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    subLayer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移3，y向下偏移2，默认(0, -3),这个跟shadowRadius配合使用
    subLayer.shadowOpacity = 0.8;//阴影透明度，默认0
    subLayer.shadowRadius = self.layer.cornerRadius;//阴影半径，默认3
    [self.superview.layer insertSublayer:subLayer below:self.layer];
}

-(void)centerWithView:(UIView*)fatherView
{
    self.center=CGPointMake(fatherView.width/2, fatherView.height/2);
}
-(void)guideForFrame:(CGRect)rect
{
    CGRect rect1=RECT(rect.origin.x-5, rect.origin.y-5, rect.size.width+10, rect.size.height+10);
    UIBezierPath *tempPath = [UIBezierPath bezierPathWithRoundedRect:rect1 byRoundingCorners:(UIRectCornerTopLeft |UIRectCornerTopRight |UIRectCornerBottomRight|UIRectCornerBottomLeft) cornerRadii:CGSizeMake(rect1.size.width/2, rect1.size.height/2)];
    self.layer.mask = [self addTransparencyViewWith:tempPath];

}
- (CAShapeLayer *)addTransparencyViewWith:(UIBezierPath *)tempPath{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    [path appendPath:tempPath];
    path.usesEvenOddFillRule = YES;

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor= [UIColor blackColor].CGColor;  //其他颜色都可以，只要不是透明的
    shapeLayer.fillRule=kCAFillRuleEvenOdd;
    return shapeLayer;
}
- (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor {

    theView.layer.masksToBounds = NO;
        // 阴影颜色
    theView.layer.shadowColor = theColor.CGColor;
        // 阴影偏移，默认(0, -3)
    theView.layer.shadowOffset = CGSizeMake(0,0);
        // 阴影透明度，默认0
    theView.layer.shadowOpacity = 0.3;
        // 阴影半径，默认3
    theView.layer.shadowRadius = LeftMargin;
}
- (void)shadowWithOffset:(CGFloat)offset{
    self.layer.masksToBounds = NO;
        // 阴影颜色
    self.layer.shadowColor = BlackColor.CGColor;
        // 阴影偏移，默认(0, -3)
    self.layer.shadowOffset = CGSizeMake(0,0);
        // 阴影透明度，默认0
    self.layer.shadowOpacity = 0.3;
        // 阴影半径，默认3
    self.layer.shadowRadius = offset;
}
-(void)addLineAtTopOrBottom:(BOOL)topOrBottom
{
    UIView*fatherview=self;
    UIView*lineview= [[UIView alloc]initWithFrame:RECT(0,topOrBottom?(fatherview.height-0.5):0, fatherview.width, 0.5)];
    lineview.backgroundColor=LineColor;
    [fatherview addSubview:lineview];
}
-(void)topCorner:(CGFloat)corner{

        // 左上和右上为圆角

    UIBezierPath *cornerRadiusPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(corner, corner)];

    CAShapeLayer *cornerRadiusLayer = [ [CAShapeLayer alloc ] init];

    cornerRadiusLayer.frame = self.bounds;

    cornerRadiusLayer.path = cornerRadiusPath.CGPath; self.layer.mask = cornerRadiusLayer;
}
-(void)botCorner:(CGFloat)corner{

        // 左上和右上为圆角

    UIBezierPath *cornerRadiusPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(corner, corner)];

    CAShapeLayer *cornerRadiusLayer = [ [CAShapeLayer alloc ] init];

    cornerRadiusLayer.frame = self.bounds;

    cornerRadiusLayer.path = cornerRadiusPath.CGPath; self.layer.mask = cornerRadiusLayer;
}
-(UIImageView*)addSmallImg:(NSString*)imgstr w:(CGFloat)imgW
                         h:(CGFloat)imgh{
        //    NSString*imgstr=imgstr;
    UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, 0, imgW, imgh)];
    [iv centerWithView:self];
    UIImage*image=[UIImage imageNamed:imgstr];
    iv.image=image;

    [self addSubview:iv];
    return iv;
}
-(void)commonCellBackColor
{
    self.backgroundColor=[BlackColor colorWithAlphaComponent:0.25];
}
-(void)addTapGr:(id)target sel:(SEL)sel
{
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:target action:sel];
    [self addGestureRecognizer:tap];
}
- (void)addTopPicAndCornerView:(NSString*)imgstr totalH:(CGFloat)totalh
{
    UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, 0, WINDOWW, totalh)];
    UIImage*image=[UIImage imageNamed:imgstr];
    iv.image=image;

    [self addSubview:iv];

    {
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(0, iv.bottom-20, WINDOWW, 20);
    backView.backgroundColor=[UIColor whiteColor];
    [backView topCorner:APPCorner*2];
    [self addSubview:backView];
    }
}
- (void)addTopPicAndCornerView
{
    [self addTopPicAndCornerView:@"pic_beijing2" totalH:pic_beijing_h];
}
-(UIView*)getSelfCenterCircleViewWith:(CGFloat)extraW extraColor:(UIColor*)extraColor
{
    UIView*vie=[[UIView alloc]init];
    CGFloat old_w_h=self.width;
    CGFloat now_w_h=old_w_h+extraW*2;
    vie.frame=RectWithCenter(self.center, now_w_h, now_w_h);
    vie.backgroundColor=extraColor;
    [vie cornerHG2];
    [self.superview addSubview:vie];
    [self.superview insertSubview:vie belowSubview:self];
    return vie;
}
+(UIView*)getRankTopViewWithThreeDatas:(NSArray*)datas imgstr:(NSString*)imgstr
{
    UIImageView*backView=[[UIImageView alloc]init];
    backView.backgroundColor=RGB(38, 46, 55, 1);
    backView.image=[UIImage imageNamed:imgstr];
    backView.frame=RECT(0, 0, WINDOWW, 236);



    NSMutableArray*cxs=[[NSMutableArray alloc]initWithObjects:@(WINDOWW/2),@(WINDOWW/4),@(WINDOWW/4*3), nil];
    NSMutableArray*cys=[[NSMutableArray alloc]initWithObjects:@(76),@(136),@(136), nil];
    CGFloat imgwh=58;
    UIView*fatherview=backView;
    for (int i=0; i<MIN(datas.count, 3); i++) {
        NSDictionary*dic=datas[i];
            //        "name": "李倩男",
            //        "totalScore": 500,
            //        "headPic": "http://thirdwx.qlogo.cn/mmopen/Q3auHgzwzM5TC9nBib2y1d6km7t44Aw5F3zWHTJLTmclFuHmtY2lFIBFfpLk5
        NSString*imgstr=[dic objectForKey:@"headPic"];
        UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, 0, imgwh, imgwh)];
        [iv cornerHG2];
        iv.center=CGPointMake([cxs[i]floatValue], [cys[i]floatValue]);
        [iv setPortraitWithImgstr:imgstr];

        [fatherview addSubview:iv];

            //        UIView*fatherView=nil;
        UIFont*font=font(12);
        UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(0, iv.bottom+6, WINDOWW/4, font.pointSize)];
        alab.centerX=iv.centerX;
        alab.font=font;
        alab.textColor=WhiteColor;
        alab.text=[dic objectForKey:@"name"];
        alab.textAlignment=NSTextAlignmentCenter;

        [fatherview addSubview:alab];

            //        UIView*fatherView=nil;
        UIFont*font1=font(18);
        UILabel*blab=[[UILabel alloc]initWithFrame:CGRectMake(0, alab.bottom+6, WINDOWW/4, font1.pointSize)];
        blab.centerX=iv.centerX;
        blab.font=font1;
        blab.textColor=WhiteColor;
        blab.text=[[dic objectForKey:@"totalScore"]numOrStringValue];
        blab.textAlignment=NSTextAlignmentCenter;

        [fatherview addSubview:blab];
    }
    {
    UIView*topview=[[UIView alloc]init];
    topview.frame=RECT(0, backView.bottom-20, WINDOWW, 20);
    topview.backgroundColor=[UIColor whiteColor];
    [topview topCorner:APPCorner*2];
    [backView addSubview:topview];
    }

    return backView;
}
+(UIView*)getRankTopViewWithThreeDatas:(NSArray*)datas
{
    return [self getRankTopViewWithThreeDatas:datas imgstr:@"pic_beijing3"];
}
+(UIView*)getRankTeacherTopViewWithThreeDatas:(NSArray*)datas
{
    return [self getRankTopViewWithThreeDatas:datas imgstr:nil];
}
+(UIView*)getSearchEmptyView
{
    UIView*emptyView=[[UIView alloc]initWithFrame:RECT(0, 0,WINDOWW , WINDOWH-NavHeight-kHomeBarHeight)];
    NSString*imgstr=@"无结果";
    UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, 118, 131.5, 131.5)];
    iv.centerX=WINDOWW/2;
    UIImage*image=[UIImage imageNamed:imgstr];
    iv.image=image;
//        iv.alpha=0.6;

    [emptyView addSubview:iv];

    UIFont*font=font(13);
    NSArray*ys=@[@(iv.bottom+24)];
    NSArray*texts=@[@"没有找到相关结果，换个关键字试试吧～",@""];
    NSArray*colors=[NSArray arrayWithObjects:ThreeColor, nil];
    for (int i=0; i<1; i++) {
        UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(0, [ys[i] floatValue], WINDOWW, font.pointSize)];
        alab.centerX=WINDOWW/2;
        alab.font=font;
        alab.textColor=colors[i];
        alab.text=texts[i];
        alab.textAlignment=NSTextAlignmentCenter;

        [emptyView addSubview:alab];
    }
    return emptyView;

}
+(UIView*)addTailAndFatherView:(UIView*)vie tailH:(CGFloat)tailH tailColor:(UIColor*)tailColor
{
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(vie.x, vie.y, vie.width, vie.height+tailH);
    backView.backgroundColor=tailColor;
    [backView addSubview:vie];
    return backView;
}
+(UIView*)hasSonBtnSWithImgs:(NSArray*)img_strs space:(CGFloat)space horiztontalOrVertical:(BOOL)horiztontalOrVertical target:(id)target sel:(SEL)asel
{
    UIView*backView=[[UIView alloc]init];
    //父view的x、y坐标为0，宽度是排版方向的子view的最大值，高度是space加上该方向子view属性之和。
    CGFloat total_pai_ban_fang_xiang=0;
    CGFloat max_pai_ban_fang_xiang=0;

    CGFloat index=0;
    for (NSString*imgstr in img_strs) {
        UIImage*img=nil;
        CGFloat width=0;
        CGFloat height=0;
        NSString*real_imgstr=imgstr;
        if ([imgstr containsString:SizeSeprator]) {//如果指定了宽高，
            NSInteger index=[imgstr rangeOfString:SizeSeprator].location;
            NSString*size_str=[imgstr substringFromIndex:index+SizeSeprator.length];
            NSArray*arr=[size_str componentsSeparatedByString:@","];
            width=[arr[0] floatValue];
            height=[arr[1] floatValue];
            real_imgstr=[imgstr substringToIndex:index];
        }else if(![imgstr containsString:@"http"])
        {//没指定的本地图片
        img=[UIImage imageNamed:imgstr];
        CGSize imgsize=img.size;
        width=imgsize.width;
        height=imgsize.height;
        }
        else
            {//没指定大小的http图片
            width=30;
            height=30;
            }
        UIButton*imgbtn=[[UIButton alloc]init];

        [backView layoutSonView:imgbtn width:width height:height paiban_value:total_pai_ban_fang_xiang horiztontalOrVertical:horiztontalOrVertical];


        if (target&&asel) {
        [imgbtn addTarget:target action:asel forControlEvents:UIControlEventTouchUpInside];
        }
        imgbtn.tag=index;
        index++;

         [imgbtn setWithImgstr:real_imgstr];




        total_pai_ban_fang_xiang+=((horiztontalOrVertical?height:width)+space);
        max_pai_ban_fang_xiang=MAX(max_pai_ban_fang_xiang, horiztontalOrVertical?width:height);


    }


    CGFloat width=horiztontalOrVertical?max_pai_ban_fang_xiang:total_pai_ban_fang_xiang;
    CGFloat height=horiztontalOrVertical?total_pai_ban_fang_xiang:max_pai_ban_fang_xiang;

    backView.frame=RECT(0, 0, width, height);
    backView.backgroundColor=[UIColor whiteColor];
    return backView;

}
-(void)layoutSonView:(UIView*)sonview width:(CGFloat)width height:(CGFloat)height paiban_value:(CGFloat)paiban_value horiztontalOrVertical:(BOOL)horiztontalOrVertical
{
    [self addSubview:sonview];
    NSLayoutConstraint *lc=[NSLayoutConstraint constraintWithItem:sonview attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:0 constant:width];
    NSLayoutConstraint *lc1=[NSLayoutConstraint constraintWithItem:sonview attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:(NSLayoutAttributeNotAnAttribute) multiplier:0 constant:height];
    NSLayoutAttribute first_attribute=horiztontalOrVertical?NSLayoutAttributeCenterX:NSLayoutAttributeCenterY;
    NSLayoutAttribute second_attribute=horiztontalOrVertical?(NSLayoutAttributeWidth):NSLayoutAttributeHeight;

    NSLayoutConstraint *lc2=[NSLayoutConstraint constraintWithItem:sonview attribute:first_attribute relatedBy:(NSLayoutRelationEqual) toItem:self attribute:second_attribute multiplier:0.5 constant:0];
    NSLayoutConstraint *lc3=[NSLayoutConstraint constraintWithItem:sonview attribute:horiztontalOrVertical?(NSLayoutAttributeTop):NSLayoutAttributeLeft relatedBy:(NSLayoutRelationEqual) toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:paiban_value];
    [sonview addConstraint:lc];
    [sonview addConstraint:lc1];
    [self addConstraint:lc2];
    [self addConstraint:lc3];
}
#pragma mark-line
-(void)addLineAtTopOrBottom:(BOOL)topOrBottom space:(CGFloat)space
{
    [self addLineAtTopOrBottom:topOrBottom left:space right:space];
}
-(void)addLineAtTopOrBottom:(BOOL)topOrBottom left:(CGFloat)left right:(CGFloat)right
{
    UIView*fatherview=self;
    UIView*lineview= [[UIView alloc]initWithFrame:RECT(left,topOrBottom?(fatherview.height-0.5):0, fatherview.width-left-right, 0.5)];
    lineview.backgroundColor=LineColor;
    [fatherview addSubview:lineview];
}
#pragma mark-webview
+(WKWebView*)getAWebViewWithFrame:(CGRect)frame delegate:(id)delegate {
    //以下代码适配大小
    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";

    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    [wkUController addUserScript:wkUScript];

    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    wkWebConfig.userContentController = wkUController;
    WKWebView*webView = [[WKWebView alloc] initWithFrame:frame configuration:wkWebConfig];
//    [_webView setUserInteractionEnabled:YES];//是否支持交互
    webView.UIDelegate=delegate;
    webView.navigationDelegate=delegate;
//    [_webView setOpaque:YES];//opaque是不透明的意思

    return webView;
}
@end
