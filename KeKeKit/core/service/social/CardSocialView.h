//
//  CardSocialView.h
//  ZiLuoLan
//
//  Created by CZK on 2020/4/10.
//  Copyright © 2020 lingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardSocialView : UIView
@property(nonatomic,strong)NSMutableArray* btns;
- (instancetype)initWithWords:(NSArray*)words;
@end

NS_ASSUME_NONNULL_END
