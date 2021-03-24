//
//  QRCodeTool.h
//  FirstProject
//
//  Created by KeKe on 3018/10/6.
//  Copyright © 3018年 awen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QRCodeTool : NSObject
-(UIImage*)createWithSize:(CGFloat)width url:(NSString*)url;
@end
