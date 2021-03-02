//
//  UITextView+Style.m
//  ZiLuoLan
//
//  Created by CZK on 2020/5/27.
//  Copyright © 2020 lingxin. All rights reserved.
//

#import "UITextView+Style.h"


@implementation UITextView (Style)
-(void)setPlaceStr:(NSString*)placeStr
{
    objc_setAssociatedObject(self, @"placeStr", placeStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(void)setNormalTextColor:(UIColor*)normalTextColor
{
    objc_setAssociatedObject(self, @"normalTextColor", normalTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)placeStyle
{
    NSString* placestr=objc_getAssociatedObject(self, @"placeStr");
    self.text=placestr;
    self.textColor=PlaceColor;
}

-(void)normalStyle
{
    UIColor*textColor=objc_getAssociatedObject(self, @"normalTextColor");
    self.textColor=textColor;
}
-(BOOL)isPlaceStyle
{
    BOOL result_no= (self.text.length>0)&&(![self.textColor isEqualToColor:PlaceColor]);
    return !result_no;
}
@end
