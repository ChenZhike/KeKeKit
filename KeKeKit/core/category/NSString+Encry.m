//
//  NSString+Encry.m
//  FirstProject
//
//  Created by KeKe on 3018/9/14.
//  Copyright © 3018年 awen. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import "NSString+Encry.h"
@implementation NSString (Encry)
+ (NSString *)md5String:(NSString *)str;
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (uint32_t)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
            ];

}

- (NSString *)md5
{
    return [NSString md5String:self];
}
#if kSupportGTM64
#pragma mark - hashing
- (NSString *)base64Encoding
{
    NSData *stringData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedString = [GTMBase64 stringByEncodingData:stringData];

    return encodedString;
}
#endif
- (NSString *)stringByUrlEncoding
{
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    NSString *encoded = [self stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
    return encoded;
}
@end
