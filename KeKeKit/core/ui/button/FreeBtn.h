//
//  FreeBtn.h
//  Xiu
//
//  Created by CZK on 2018/11/28.
//  Copyright © 2018 czk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelStyle.h"
NS_ASSUME_NONNULL_BEGIN

@interface FreeBtn : UIButton
+(FreeBtn*)flextWidthBtnWithHeight:(CGFloat)height ivStr:(NSString*)ivStr attributeTitle:(NSAttributedString*)attributeTitle innserspace:(CGFloat)innserspace screenspace:(CGFloat)screenspace;
-(id)initWithRect:(CGRect)rect Title:(NSString*)title labstyle:(LabelStyle*)ls
       titleFrame:(CGRect)titleFrame  ivStr:(NSString*)ivStr  ivFrame:(CGRect)ivFrame;
@property(nonatomic,strong)UILabel* lab;
@property(nonatomic,strong)UIImageView* iv;
- (void)normalOrHighlightedStyle:(BOOL)normalOrHighlighted;

@end

NS_ASSUME_NONNULL_END
