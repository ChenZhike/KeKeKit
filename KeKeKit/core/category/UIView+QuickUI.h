    //
    //  UIView+QuickUI.h
    //  CZKFrameWork
    //
    //  Created by CZK on 2018/12/17.
    //  Copyright © 2018 czk. All rights reserved.
    //

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN
UIKIT_EXTERN NSString * const SizeSeprator;
@interface UIView (QuickUI)
-(void)cornerHG2;
-(void)corner:(CGFloat)cornerRadius;
-(void)borderColr:(UIColor*)color width:(CGFloat)width;
-(void)addBackShadow;
-(void)centerWithView:(UIView*)fatherView;
-(void)guideForFrame:(CGRect)rect;
-(void)addLineAtTopOrBottom:(BOOL)topOrBottom;
- (void)shadowWithOffset:(CGFloat)offset;
- (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor;
-(void)topCorner:(CGFloat)corner;
-(void)botCorner:(CGFloat)corner;
-(UIImageView*)addSmallImg:(NSString*)imgstr w:(CGFloat)imgW
                         h:(CGFloat)imgh;
-(void)commonCellBackColor;
-(void)addTapGr:(id)target sel:(SEL)sel;
- (void)addTopPicAndCornerView;
- (void)addTopPicAndCornerView:(NSString*)imgstr totalH:(CGFloat)totalh;
-(UIView*)getSelfCenterCircleViewWith:(CGFloat)extraW extraColor:(UIColor*)extraColor;
    //展示详情cell顶部带图
+(UIView*)getRankTopViewWithThreeDatas:(NSArray*)datas;//获得顶部前三view
+(UIView*)getRankTeacherTopViewWithThreeDatas:(NSArray*)datas;
+(UIView*)getSearchEmptyView;
+(UIView*)addTailAndFatherView:(UIView*)vie tailH:(CGFloat)tailH tailColor:(UIColor*)tailColor;
+(UIView*)hasSonBtnSWithImgs:(NSArray*)img_strs space:(CGFloat)space horiztontalOrVertical:(BOOL)horiztontalOrVertical target:(id)target sel:(SEL)asel;
-(void)layoutSonView:(UIView*)sonview width:(CGFloat)width height:(CGFloat)height paiban_value:(CGFloat)paiban_value horiztontalOrVertical:(BOOL)horiztontalOrVertical;
#pragma mark-line
-(void)addLineAtTopOrBottom:(BOOL)topOrBottom space:(CGFloat)space;
-(void)addLineAtTopOrBottom:(BOOL)topOrBottom left:(CGFloat)left right:(CGFloat)right;
#pragma mark-webview
+(WKWebView*)getAWebViewWithFrame:(CGRect)frame delegate:(id)delegate;
@end

NS_ASSUME_NONNULL_END
