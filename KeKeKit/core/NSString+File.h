//
//  NSString+File.h
//  FirstProject
//
//  Created by 陈志科 on 2019/12/10.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (File)
-(BOOL)isimg;
-(NSMutableDictionary*)parseBy_QianTao_One;
-(NSArray*)parseBy_DanHang_Just;
- (NSArray*)ParseByQianTaoValuesToArr;
-(NSMutableDictionary*)parseByJustQianTao_One;
@end

NS_ASSUME_NONNULL_END
