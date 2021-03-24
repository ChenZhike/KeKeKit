//
//  ShadowCornerBtn.m
//  微金在线
//
//  Created by 首控微金财富 on 2017/12/25.
//  Copyright © 2017年 zhouli. All rights reserved.
//

#import "ShadowCornerBtn.h"

@interface ShadowCornerBtn()

@property (nonatomic, assign) BOOL wj_enabled;// default is YES
@property (nonatomic, weak) CAGradientLayer *gradientLayer;
@end

@implementation ShadowCornerBtn

- (void)awakeFromNib
{
    [super awakeFromNib];
     self.wj_enabled = YES;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
         self.wj_enabled = YES;
    }
    return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:[UIColor clearColor]];
}
-(void)setThreeColorsArray:(NSArray*)colors
{
    self.startColor=colors[0];
    self.middleColor=colors[1];
    self.endColor=colors[2];
}
- (void)drawRect:(CGRect)rect
{
    if (self.threeColors==nil) {
        NSArray*colors=@[RGB(251,138,36,1),[UIColor colorWithHex:@"#ff6a00"],RGB(255,102,0,1)];
        [self setThreeColorsArray:colors];
    }
    UIColor *color_middle =self.middleColor;

    CGFloat selfH = rect.size.height;
    self.layer.cornerRadius = selfH/2;
    self.layer.shadowColor = color_middle.CGColor;
    self.layer.shadowOpacity = 0.35f;
    self.layer.shadowOffset = CGSizeMake(0, 3.5 * selfH/41);
    
    if (self.gradientLayer) return;
    UIColor *color_start =self.startColor;
    UIColor *color_end =self.endColor;
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    CGFloat alpha = self.wj_enabled?1.f:.5;
    gradientLayer.opacity = alpha;
    self.gradientLayer = gradientLayer;
    gradientLayer.colors = @[(__bridge id)color_start.CGColor, (__bridge id)color_middle.CGColor, (__bridge id)color_end.CGColor];
//    gradientLayer.position = self.center;
    gradientLayer.locations = @[@0.0, @.5, @1.0];
    gradientLayer.type = kCAGradientLayerAxial;
    gradientLayer.startPoint = CGPointMake(0, .5);
    gradientLayer.endPoint = CGPointMake(1.f, .6);
    gradientLayer.cornerRadius = selfH/2;
    gradientLayer.masksToBounds = YES;
    gradientLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    [self.layer insertSublayer:gradientLayer atIndex:0];
//    DLOG(@"gradientLayerdrawRect");
    gradientLayer.shouldRasterize = self.layer.shouldRasterize = YES;
//    当shouldRasterize设成true时，layer被渲染成一个bitmap，并缓存起来，等下次使用时不会再重新去渲染了。实现圆角本身就是在做颜色混合（blending），如果每次页面出来时都blending，消耗太大，这时shouldRasterize = yes，下次就只是简单的从渲染引擎的cache里读取那张bitmap，节约系统资源。
    gradientLayer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)setEnabled:(BOOL)enabled
{
    CGFloat alpha = 0;
    if (enabled == YES) {
        
        alpha = 1.f;
    }else{
        alpha = .5f;
    }
    self.alpha = alpha;
//    [super setEnabled:enabled];
    self.userInteractionEnabled = enabled;
    self.wj_enabled = enabled;
}

- (void)setAlpha:(CGFloat)alpha
{
    CALayer *gradientLayer = self.layer.sublayers.firstObject;
    if ([gradientLayer isKindOfClass:[CAGradientLayer class]]) {
        
        gradientLayer.opacity = alpha;
//        DLOG(@"gradientLayer");
    }
}
@end
