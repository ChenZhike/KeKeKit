//
//  XWGradientLabel.m
//  GradientLabel
//
//  Created by Mac on 2017/9/30.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "XWGradientLabel.h"

@interface XWGradientLabel ()

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation XWGradientLabel

#pragma mark - Main

- (instancetype)init
{
    self = [super init];
    if (self) {
        _gradientLayer = (CAGradientLayer *)self.layer;
        _gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 1);
        
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:_textLabel];
        
        self.layer.mask = _textLabel.layer;
    }
    return self;
}

+ (Class)layerClass
{
    return [CAGradientLayer class];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.frame = self.bounds;
}

#pragma mark - Properties

- (void)setText:(NSString *)text
{
    _text = text;
    
    _textLabel.text = text;
    CGSize size = [_textLabel sizeThatFits:CGSizeZero];
    [_textLabel sizeToFit];
    
    self.bounds = CGRectMake(0, 0, size.width, size.height);
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    
    _textLabel.font = font;
    CGSize size = [_textLabel sizeThatFits:CGSizeZero];
    [_textLabel sizeToFit];
    
    self.bounds = CGRectMake(0, 0, size.width, size.height);
}

- (void)setStartPoint:(CGPoint)startPoint
{
    _startPoint = startPoint;
    
    _gradientLayer.startPoint = startPoint;
}

- (void)setEndPoint:(CGPoint)endPoint
{
    _endPoint = endPoint;
    
    _gradientLayer.endPoint = endPoint;
}

- (void)setColors:(NSArray<UIColor *> *)colors
{
    _colors = colors;
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors) {
        [mutableArray addObject:(__bridge id)color.CGColor];
    }
    _gradientLayer.colors = [mutableArray copy];
}

@end
