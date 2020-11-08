//
//  NSString+Encry.h
//  FirstProject
//
//  Created by KeKe on 3018/9/14.
//  Copyright © 3018年 awen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encry)
    // 将str加密成本地保存的文件名
+ (NSString *)md5String:(NSString *)str;
- (NSString *)md5;
#pragma mark Hashing
#if kSupportGTM64
- (NSString *)base64Encoding;
#endif
    //将字符串以URL格式编码
- (NSString *)stringByUrlEncoding;
@end
