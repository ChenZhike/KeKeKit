//
//  NSString+ParseLanguage.h
//  KeKeKit
//
//  Created by KeKe on 2021/03/30.
//  Copyright © 2021年 KeKe. All rights reserved.
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
