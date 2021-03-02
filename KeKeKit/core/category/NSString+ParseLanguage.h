//
//  NSString+ParseLanguage.h
//  FirstProject
//
//  Created by KeKe on 3018/9/14.
//  Copyright © 3018年 awen. All rights reserved.
//

#import <Foundation/Foundation.h>
char pinyinFirstLetter(unsigned short hanzi);
@interface NSString (ParseLanguage)
-(NSString*)firstPinYin;
    // 是否带有表情府
- (BOOL)isContainsEmoji;
- (NSString *)emjoiText;
-(NSString *)getNOHtmlStr;
@end
