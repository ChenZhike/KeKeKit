//
//  UibodyDefine.h
//  easiiosip
//
//  Created by feng jinbiao on 13-9-28.
//  Copyright (c) 2013年 easiio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
static NSString* _Nullable const UpdateFontNotiName=@"UpdateFontNotiName";
static NSString* _Nullable const reLoginNoti=@"reLoginNoti";
static NSString* _Nullable const UpdateTextColorNotiName=@"UpdateTextColorNotiName";
static NSString*const UpdateBacImgNotiName=@"UpdateBacImgNotiName";
//^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
typedef NSObject* _Nullable (^dataResponseBlock)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);
@interface UibodyDefine : NSObject
UIView * _Nullable vie(CGRect rct);
UIView * _Nullable vieWhite(CGRect rct);
UILabel * _Nullable label(UIFont * _Nullable font, NSTextAlignment algnment,CGRect rct,int tag);
UILabel * _Nullable getAPointLab(void);
UIImageView* _Nullable iv(CGRect rct,NSString* _Nullable imgName);
UIButton* _Nullable imgSelBtn(CGRect rct,NSString * _Nullable selImageName,NSString* _Nullable nImageName,SEL _Nullable action,id _Nullable target);
UIButton* _Nullable imgBtn(CGRect rct,NSString * _Nullable hImageName,NSString* _Nullable nImageName,SEL _Nullable action,id _Nullable target);
UIButton* _Nullable imgBtnEX(CGRect rct,NSString * _Nullable hImageName,NSString* _Nullable nImageName,SEL _Nullable action,id _Nullable target);
UIButton* _Nullable textBtn(CGRect rct,NSString * _Nullable text,UIColor * _Nullable color,SEL _Nullable action,id _Nullable target,UIFont * _Nullable fnt);
UITextField* _Nullable textField(CGRect rct,NSString * _Nullable placehode,NSString* _Nullable text ,UIFont* _Nullable font,UIColor * _Nullable textcolor);
UIButton* _Nullable imgTextBtn(CGRect rct,NSString * _Nullable text,NSString * _Nullable hImageName,NSString* _Nullable nImageName, SEL _Nullable action,id _Nullable target,UIColor * _Nullable color,UIFont * _Nullable fnt);
UIButton* _Nullable bcBtnCreate(NSString* _Nullable title,SEL _Nullable method,id _Nullable target,CGRect rect );
UIButton* _Nullable imgBtnNormal(CGRect rct,NSString * _Nullable hImageName,NSString* _Nullable nImageName,SEL _Nullable action,id _Nullable target);
void showSuccessMsg(NSString * _Nullable msg);
void showInfoMsg(NSString * _Nullable msg);
void desMsg(void);
void showMsg(NSString * _Nullable msg);
void showDownLoadState(NSString * _Nonnull msg);
void showErrorMsg(NSString * _Nonnull msg);
void showFormatWarnWithTitle(NSString* _Nonnull title);
void showFormatWarnWithTitleMessage(NSString* _Nullable title,NSString* _Nullable message);
void showFormatWarnWithTitleMessageOKString(NSString* _Nullable title,NSString* _Nullable message,NSString* _Nullable okstr);
//void showErroeMsgEx(NSString *msg);
BOOL unZip(NSString * _Nullable path,NSString * _Nullable bookid);
void closeUserInteraction(void);//关闭用户交互
void openUserInteraction(void);//打开用户交互
NSString * _Nullable getChartersDetail(NSString * _Nullable path ,int place);
NSData * _Nullable getCharters(NSString * _Nullable bookId);
void labelAnimation(NSString * _Nullable str);
NSString * _Nullable getDownLoadBookPathByBookId(NSString * _Nullable bookId);
#pragma mark-日期分割线
NSDate * _Nullable getCurrentTimeZone_Date(void);
NSString * _Nullable getCurrentDate(void);
NSString * _Nullable getCurrentTime(void);
NSString * _Nullable getCurrentHHmmss(void);
NSString * _Nullable getImageUrl(NSString * _Nullable imgName);
NSMutableAttributedString* _Nullable getTVWords(NSString* _Nullable str,UIFont* _Nullable font);
CGAffineTransform aspectFit(CGRect innerRect, CGRect outerRect);
double radians (double degrees);
UIColor* _Nullable globalTextColor(void);
void setGlobalTextColor(UIColor* _Nullable color);
UIFont* _Nullable globalTextFont(void);
void setGlobalTextFont(UIFont* _Nullable font);
NSString* _Nullable globalBackImg(void);
void setGlobalBackImg(NSString* _Nullable imgstr);
NSString* _Nullable APPDownloadUrlWithAPPID(NSString* _Nullable appid);
#pragma mark-frame
CGRect cxFrame(CGFloat cx,CGFloat y,CGFloat width,CGFloat height);
CGRect cyFrame(CGFloat x,CGFloat cy,CGFloat width,CGFloat height);
CGRect RectWithCenter(CGPoint center,CGFloat width,CGFloat height);
CGRect cyFrameRightWH(CGFloat right,CGFloat cy,CGFloat width,CGFloat height);
CGRect cyFrame(CGFloat x,CGFloat cy,CGFloat width,CGFloat height);
CGRect RectWithCenterSize(CGPoint center,CGSize size);
#pragma mark-image-size
-(CGSize)imgSizeWithSuperSize:(CGSize)superSize imgStr:(NSString*)imgStr one_side_space_percent:(CGFloat)one_side_space_percent;
@end
