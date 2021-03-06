//
//  NSAttributedString+HeightCalculated.h
//  KeKeKit
//
//  Created by KeKe on 16/1/19.
//  Copyright © 2016年 keke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (HeightCalculated)
//使用默认样式
-(CGFloat)getFlexableWidth;
-(CGFloat)getHeightWithMaxW:(CGFloat)maxW;
+(NSAttributedString*)contentAttributeWithPerH:(CGFloat)perh text:(NSString*)text;
@end
