//
//  NSString+Calcute.h
//  FirstProject
//
//  Created by CZK on 2019/6/11.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Calcute)
-(NSString*)plusInt:(int)value;
-(NSString*)plusFloat:(CGFloat)value;
-(int)maxLineWithFont:(UIFont*)font maxW:(CGFloat)maxW;
-(int)maxLine_rightContent:(BOOL)hasTopPic;

-(int)maxLine_paraContent:(BOOL)hasTopPic;
-(CGFloat)maxNeedH_rightContent:(BOOL)hasTopPic;
-(CGFloat)maxNeedH_paraContent:(BOOL)hasTopPic;
-(CGFloat)maxNeedH_paraTotalContent:(BOOL)hasTopPic;
-(NSInteger)firstIndexInString:(NSString*)str;
-(NSDictionary*)kvDic;
@end

NS_ASSUME_NONNULL_END
