//
//  HotYuleTopView.h
//  LOLNews
//
//  Created by CZK on 2019/6/25.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HotYuleTopView : UIView
-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titles defalutColor:(UIColor*)defalutColor
       selectColor:(UIColor*)selectColor
              font:(UIFont*)font
       suggestPerW:(CGFloat)suggestPerW;
-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titles defalutColor:(UIColor*)defalutColor
       selectColor:(UIColor*)selectColor
              font:(UIFont*)font
              selectfont:(UIFont*)selectfont
       suggestPerW:(CGFloat)suggestPerW;
@property(nonatomic,strong)NSMutableArray* btns;
@property(nonatomic,strong,nullable)UIScrollView*sc;
@property(nonatomic,strong,nullable)UIFont* normalFont;
@property(nonatomic,strong,nullable)UIFont* selectFont;
-(void)selectIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
