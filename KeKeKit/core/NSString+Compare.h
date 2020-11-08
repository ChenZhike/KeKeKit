//
//  NSString+Compare.h
//  VoiceHelper
//
//  Created by CZK on 2019/12/7.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Compare)
-(NSComparisonResult)compareHHMM:(NSString*)HHMM;
@end

NS_ASSUME_NONNULL_END
