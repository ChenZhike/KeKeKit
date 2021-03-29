//
//  UibodyDefine.m
//  easiiosip
//
//  Created by feng jinbiao on 13-9-28.
//  Copyright (c) 2013年 easiio. All rights reserved.
//

#import "UibodyDefine.h"
#import "SVProgressHUD.h"
//#import "CustomAlertView.h"
//#import "ZipArchive.h"
//#import "SBJsonParser.h"
static UIFont*globalTextFont0=nil;
static UIColor*globalTextcolor0=nil;
static NSString*globalBackImgStr0=nil;
NSString*const fontNamekey=@"fontname";
NSString*const fontSizekey=@"fontsize";
NSString*const textColorkey=@"textColor";
NSString*const backImgKey=@"backImgKey";

@implementation UibodyDefine
#pragma mark-UI控件区域
UIView *vie(CGRect rct)
{
    UIView*avie=[[UIView alloc]initWithFrame:rct];
    return avie;
}
UIView *vieWhite(CGRect rct)
{
    UIView*avie=[[UIView alloc]initWithFrame:rct];
    avie.backgroundColor=[UIColor whiteColor];
    return avie;
}
UILabel * label(UIFont *font, NSTextAlignment algnment,CGRect rct,int tag)
{
    UILabel *lbel = [UILabel.alloc initWithFrame:rct];
    lbel.backgroundColor = [UIColor clearColor];
    lbel.textAlignment = algnment;
    lbel.tag   = tag;
    lbel.font = font;
    return lbel;
}
UILabel * getAPointLab()
{
    UILabel*alab=label(font(14.7+2), NSTextAlignmentCenter, RECT(0, 0, 10, 15), 0);
    //    alab.textColor=HomePageCellYindaoTextColor;
    alab.text=@"·";
    return alab;
}

UIImageView* iv(CGRect rct,NSString*imgName)
{
    UIImageView*iv=[[UIImageView alloc]initWithFrame:rct];
    iv.image=[UIImage imageNamed:imgName];
    return iv;
}
UIButton* imgTextBtn(CGRect rct,NSString *text,NSString *hImageName,NSString* nImageName, SEL action,id target,UIColor *color,UIFont *fnt)
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (hImageName) {
          [btn setBackgroundImage:[[UIImage imageNamed:hImageName] stretchableImageWithLeftCapWidth:8 topCapHeight:8] forState:UIControlStateHighlighted];
    }
  
    if (nImageName) {
          [btn setBackgroundImage:[[UIImage imageNamed:nImageName] stretchableImageWithLeftCapWidth:8 topCapHeight:8] forState:UIControlStateNormal];
    }
  
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn.titleLabel setFont:fnt];
    btn.frame = rct;
    return btn;
}
UIButton* imgSelBtn(CGRect rct,NSString *selImageName,NSString* nImageName,SEL action,id target)
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if(selImageName)
    {
        [btn setBackgroundImage:[[UIImage imageNamed:selImageName] stretchableImageWithLeftCapWidth:6 topCapHeight:6] forState:UIControlStateSelected];
    }
    if (nImageName) {
        [btn setBackgroundImage:[[UIImage imageNamed:nImageName] stretchableImageWithLeftCapWidth:6 topCapHeight:6] forState:UIControlStateNormal];
    }
    
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = rct;
    return btn;
}
UIButton* imgBtn(CGRect rct,NSString *hImageName,NSString* nImageName,SEL action,id target)
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if(hImageName)
    {
        [btn setBackgroundImage:[[UIImage imageNamed:hImageName] stretchableImageWithLeftCapWidth:6 topCapHeight:6] forState:UIControlStateHighlighted];
    }
    if (nImageName) {
        [btn setBackgroundImage:[[UIImage imageNamed:nImageName] stretchableImageWithLeftCapWidth:6 topCapHeight:6] forState:UIControlStateNormal];
    }
    
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = rct;
    return btn;
}
UIButton* imgBtnNormal(CGRect rct,NSString *hImageName,NSString* nImageName,SEL action,id target)
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if(hImageName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:hImageName] forState:UIControlStateHighlighted];
    }
    if (nImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:nImageName] forState:UIControlStateNormal];
    }
    
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = rct;
    return btn;
}
UIButton* imgBtnEX(CGRect rct,NSString *hImageName,NSString* nImageName,SEL action,id target)
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if(hImageName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:hImageName]  forState:UIControlStateHighlighted];
    }
    if (nImageName) {
        [btn setBackgroundImage:[[UIImage imageNamed:nImageName] stretchableImageWithLeftCapWidth:2 topCapHeight:2] forState:UIControlStateNormal];
        
    }
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = rct;
    return btn;
}
UIButton* bcBtnCreate(NSString* title,SEL method,id target ,CGRect rect)
{
    UIButton *btn = imgBtnNormal(rect, @"gr_jc_pressed", @"gr_jc_normal", method, target);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:font(16)];
    [btn setTitleColor:kUIColorFromRGB(0xff7620) forState:UIControlStateNormal];
    [btn setTitleColor:RGB(255  ,118 , 32 , 0.5) forState:UIControlStateHighlighted];
    return btn;
}

UIButton* textBtn(CGRect rct,NSString *text,UIColor *color,SEL action,id target,UIFont *fnt)
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rct;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn.titleLabel setFont:fnt];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
UITextField* textField(CGRect rct,NSString *placehode,NSString*text ,UIFont* font,UIColor *textcolor)
{
    UITextField *textfiled = [[UITextField alloc] initWithFrame:rct];
    textfiled.backgroundColor = [UIColor clearColor];
    textfiled.placeholder = placehode;
    textfiled.font = font;
    textfiled.text = text;
    textfiled.textColor = textcolor;
    return textfiled;
}
#pragma mark-状态区域
void desMsg()
{
    [SVProgressHUD   dismiss];
}
void showSuccessMsg(NSString *msg)
{
    [SVProgressHUD showSuccessWithStatus:msg];
}
void showInfoMsg(NSString *msg)
{
    [SVProgressHUD showInfoWithStatus:msg];
}
void showMsg(NSString *msg)
{
    [SVProgressHUD showWithStatus:msg];
}
void showDownLoadState(NSString *msg)
{
    [SVProgressHUD showWithStatus:msg maskType:SVProgressHUDMaskTypeNone];
}
void showErrorMsg(NSString *msg)
{
    [SVProgressHUD showErrorWithStatus:msg];
}
//void showErroeMsgEx(NSString *msg)
//{
//    BCAlertView *alert = [[BCAlertView alloc] initWithFrame:RECT(0, 0, WINDOWW, WINDOWH)];
//    [alert initWithTitle:@"温馨提示" content:msg cancelBtn:@"1" okstring:nil ablock:^(int index) {
//        
//    }];
//    
//}
//BOOL unZip(NSString *path,NSString *bookid)
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documents = [paths objectAtIndex:0];
//    NSString *bookPath = [documents stringByAppendingPathComponent:@"downLoad"];
//    NSString *pathdst = [bookPath stringByAppendingPathComponent:bookid];
//    ZipArchive* zip = [[ZipArchive alloc] init];
//    //NSString *documentpath = [[NSBundle mainBundle] pathForResource:@"txts" ofType:@"zip"];
//    BOOL ret = FALSE;
//    if( [zip UnzipOpenFile:path] ){
//        ret = [zip UnzipFileTo:pathdst overWrite:YES];
//        
//        [zip UnzipCloseFile];
//    }
//    return ret;
//}
void showFormatWarnWithTitle(NSString*title)
{
//    CustomAlertView*alert=[[CustomAlertView alloc]initWithTitle:@"提示" message:title delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
//    [alert show];
}
void showFormatWarnWithTitleMessage(NSString*title,NSString*message)
{
//    CustomAlertView*alert=[[CustomAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
//    [alert show];
}
void showFormatWarnWithTitleMessageOKString(NSString*title,NSString*message,NSString*okstr)
{
//    CustomAlertView*alert=[[CustomAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:okstr otherButtonTitles: nil];
//    [alert show];
}
NSString *getDownLoadBookPathByBookId(NSString *bookId)
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *bookPath = [documents stringByAppendingPathComponent:@"downLoad"];
    NSString *pathdst = [bookPath stringByAppendingPathComponent:bookId];
    return pathdst;
}
NSString *getImageUrl(NSString *imgName)
{
    return [NSString stringWithFormat:@"http://120.26.41.195:8080/mf/images/%@",imgName];
}
void closeUserInteraction()//关闭用户交互
{
    [[UIApplication sharedApplication]beginIgnoringInteractionEvents];
//    AppDelegate*delegate=  (AppDelegate*)[UIApplication sharedApplication].delegate;
//    if (delegate.window) {
//        delegate.window.userInteractionEnabled=false;
//    }
}
void openUserInteraction()//打开用户交互
{
    [[UIApplication sharedApplication]endIgnoringInteractionEvents];
//    AppDelegate*delegate=  (AppDelegate*)[UIApplication sharedApplication].delegate;
//    if (delegate.window) {
//        delegate.window.userInteractionEnabled=YES;
//    }
}
NSString *getChartersDetail(NSString *bookId ,int place)
{

    
    NSString *bookPath = [getDownLoadBookPathByBookId(bookId) stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.t",place]];
    NSData *data = [NSData dataWithContentsOfFile:bookPath ];
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
    return  [[NSString alloc]initWithData:data encoding:enc];
}
NSData *getCharters(NSString *bookId)
{
    NSString *bookPath = [getDownLoadBookPathByBookId(bookId) stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.chap",bookId]];
    return [NSData dataWithContentsOfFile:bookPath];
}
void labelAnimation(NSString *str)
{
    CGFloat wid = [str  boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font(16)} context:nil].size.width + 10;
    UILabel *la = label(font(16), NSTextAlignmentCenter, RECT(WINDOWW/2-wid/2, WINDOWH/4+NavHeight, wid, 30), 1);
    la.backgroundColor = RGB(152, 3, 3, 1);
    la.textColor = [UIColor whiteColor];
    la.text = str;
    la.alpha = 0;
    UIWindow *wd = [[UIApplication sharedApplication].delegate window];
    [wd addSubview:la];
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        la.alpha = 1;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1 delay:1.3 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
                la.alpha = 0;
                la.top -= 15;
            } completion:^(BOOL finished) {
                if (finished) {
                    [la removeFromSuperview];
                }
            }];;
        }
    }];
}
//NSString *getChartersDetail(NSString *path ,int place)
//{
//    NSString *bookPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.t",place]];
//    NSData *data = [NSData dataWithContentsOfFile:bookPath ];
//    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
//    return  [[NSString alloc]initWithData:data encoding:enc];
//}
NSDate *getCurrentTimeZone_Date(void)
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];

    NSInteger interval = [zone secondsFromGMTForDate: date];

    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}

NSString *getCurrentDate(void)
{
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    NSString *formateString = @"yyyy-MM-dd";
    [formate setDateFormat:formateString ];
    return [formate stringFromDate:[NSDate date]];
}
NSString *getCurrentTime(void)
{
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    NSString *formateString = @"yyyy-MM-dd HH:mm:ss";
    [formate setDateFormat:formateString ];
    return [formate stringFromDate:[NSDate date]];
}
NSString *getCurrentHHmmss()
{
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    NSString *formateString = @"HHmmss";
    [formate setDateFormat:formateString ];
    return [formate stringFromDate:[NSDate date]];
}
NSMutableAttributedString*getTVWords(NSString*str,UIFont*font)
{
    NSMutableAttributedString*resultAttr=[[NSMutableAttributedString alloc]initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:font.pointSize*0.2];//调整行间距
    
    [resultAttr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    [resultAttr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [str length]) ];
    return resultAttr;
}
CGAffineTransform aspectFit(CGRect innerRect, CGRect outerRect) {
	CGFloat scaleFactor = MIN(outerRect.size.width/innerRect.size.width, outerRect.size.height/innerRect.size.height);
	CGAffineTransform scale = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
	CGRect scaledInnerRect = CGRectApplyAffineTransform(innerRect, scale);
	CGAffineTransform translation =
	CGAffineTransformMakeTranslation((outerRect.size.width - scaledInnerRect.size.width) / 2 - scaledInnerRect.origin.x,
									 (outerRect.size.height - scaledInnerRect.size.height) / 2 - scaledInnerRect.origin.y);
	return CGAffineTransformConcat(scale, translation);
}

double radians (double degrees)
{
    return degrees * M_PI/180;
}
NSString* APPDownloadUrlWithAPPID(NSString* appid)
{
    NSString*result=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@?mt=8",appid];
    return result;
}
#pragma mark-皮肤主题区域
NSString* globalBackImg(void)
{
    NSString*key=backImgKey;
    if (globalBackImgStr0==nil) {
        globalBackImgStr0=[[NSUserDefaults standardUserDefaults]objectForKey:key];
        if (globalBackImgStr0==nil) {
            [[NSUserDefaults standardUserDefaults]setObject:@"梦幻背景" forKey:key];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        globalBackImgStr0=[[NSUserDefaults standardUserDefaults]objectForKey:key];
    }
    return globalBackImgStr0;
}
void setGlobalBackImg(NSString*imgstr)
{
    if (globalBackImgStr0!=imgstr) {
        NSString*key=backImgKey;
        [[NSUserDefaults standardUserDefaults]setObject:imgstr forKey:key];
        globalBackImgStr0=imgstr;
        [[NSNotificationCenter defaultCenter]postNotificationName:UpdateBacImgNotiName object:imgstr];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }

}

UIColor* globalTextColor(void)
{
    NSString*key=textColorkey;
    if (globalTextcolor0==nil) {
        NSString*colorstr=[[NSUserDefaults standardUserDefaults]objectForKey:key];
        if (colorstr==nil) {
            [[NSUserDefaults standardUserDefaults]setObject:[[UIColor blackColor]hexStr] forKey:key];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        colorstr=[[NSUserDefaults standardUserDefaults]objectForKey:key];
        globalTextcolor0=[UIColor colorWithHex:colorstr];
    }
            return globalTextcolor0;
}
void setGlobalTextColor(UIColor*color)
{
    NSString*key=textColorkey;
    [[NSUserDefaults standardUserDefaults]setObject:[color hexStr] forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
    globalTextcolor0=color;
    [[NSNotificationCenter defaultCenter]postNotificationName:UpdateTextColorNotiName object:color];
}
UIFont* globalTextFont(void)
{
    if (globalTextFont0==nil) {
        NSString*fontname=[[NSUserDefaults standardUserDefaults]objectForKey:fontNamekey];
        if (fontname==nil) {
            [[NSUserDefaults standardUserDefaults]setObject:[UIFont systemFontOfSize:15].fontName forKey:fontNamekey];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        fontname=[[NSUserDefaults standardUserDefaults]objectForKey:fontNamekey];
        NSString*fontsize=[[NSUserDefaults standardUserDefaults]objectForKey:fontSizekey];
        if (fontsize==nil) {
            [[NSUserDefaults standardUserDefaults]setObject:@"15" forKey:fontSizekey];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        fontsize=[[NSUserDefaults standardUserDefaults]objectForKey:fontSizekey];
        globalTextFont0=[UIFont fontWithName:fontname size:[fontsize floatValue]];
    }
    return globalTextFont0;
}
void setGlobalTextFont(UIFont*font)
{
    [[NSUserDefaults standardUserDefaults]setObject:font.fontName forKey:fontNamekey];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%.2f",font.pointSize] forKey:fontSizekey];
    [[NSUserDefaults standardUserDefaults]synchronize];
    globalTextFont0=font;
    [[NSNotificationCenter defaultCenter]postNotificationName:UpdateFontNotiName object:font];
}

#pragma mark-frame
CGRect cxFrame(CGFloat cx,CGFloat y,CGFloat width,CGFloat height)
{
    CGFloat x=cx-width/2;
    CGRect rect= CGRectMake(x, y, width, height);
    return rect;
}
CGRect cyFrame(CGFloat x,CGFloat cy,CGFloat width,CGFloat height)
{
    CGFloat y=cy-height/2;
    CGRect rect= CGRectMake(x, y, width, height);
    return rect;
}
CGRect RectWithCenter(CGPoint center,CGFloat width,CGFloat height)
{
    CGFloat x=center.x-width/2;
    CGFloat y=center.y-height/2;
    CGRect rect= CGRectMake(x, y, width, height);
    return rect;
}
CGRect centerFrame(CGPoint center,CGFloat width,CGFloat height)
{
    return RectWithCenter(center, width, height);
}
CGRect cyFrameRightWH(CGFloat right,CGFloat cy,CGFloat width,CGFloat height)
{
    CGFloat y=cy-height/2;
    CGRect rect= CGRectMake(right-width, y, width, height);
    return rect;

}
CGRect RectWithCenterSize(CGPoint center,CGSize size)
{
    CGFloat x=center.x-size.width/2;
    CGFloat y=center.y-size.height/2;
    CGRect rect= CGRectMake(x, y, size.width, size.height);
    return rect;
}
#pragma mark-image-size
-(CGSize)imgSizeWithSuperSize:(CGSize)superSize imgStr:(NSString*)imgStr one_side_space_percent:(CGFloat)one_side_space_percent
{
    CGFloat w=superSize.width*(1-one_side_space_percent*2);
    UIImage*img=[UIImage imageNamed:imgStr];
    CGSize img_size=img.size;
    CGFloat h=w*(img_size.height/img_size.width);
    CGSize result=CGSizeMake(w, h);
    return result;
}
@end
