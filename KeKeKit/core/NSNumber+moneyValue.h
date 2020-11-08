//
//  NSNumber+moneyValue.h
//  JinZi
//
//  Created by KeKe on 15/12/23.
//  Copyright © 2015年 fengjinbiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (moneyValue)
-(NSString*)moneyValue;//金钱值，永远都是以.XX形式
-(NSString*)adjuestIntFloatValue;//如果是带小数，那就是float两位；如果不带直接整数
@end
