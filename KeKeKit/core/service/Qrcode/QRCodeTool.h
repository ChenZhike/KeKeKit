//
//  QRCodeTool.h
//  KeKeKit
//
//  Created by KeKe on 3018/10/6.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QRCodeTool : NSObject
-(UIImage*)createWithSize:(CGFloat)width url:(NSString*)url;
@end
