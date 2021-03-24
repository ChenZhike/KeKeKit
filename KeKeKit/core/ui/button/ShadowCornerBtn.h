//
//  ShadowCornerBtn.h
//  微金在线
//
//  Created by 首控微金财富 on 2017/12/25.
//  Copyright © 2017年 zhouli. All rights reserved.
//

#import "UIColor+RGBValues.h"
#import <UIKit/UIKit.h>
// 有圆角 + 阴影 + 斜角渐变色效果的按钮
@interface ShadowCornerBtn : UIButton
@property(nonatomic,strong,nullable)UIColor* startColor;
@property(nonatomic,strong,nullable)UIColor* middleColor;
@property(nonatomic,strong,nullable)UIColor* endColor;
@property(nonatomic,strong,nullable)NSArray* threeColors;
-(void)setThreeColorsArray:(NSArray*)colors;
@end
