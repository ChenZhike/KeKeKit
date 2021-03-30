    //
    //  LabelStyle.h
    //  KeKeKit
    //
    //  Created by CZK on 3018/10/23.
    //  Copyright © 2021年 KeKe. All rights reserved.
    //

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LabelStyle : NSObject
@property(nonatomic,strong)UIFont* font;
@property(nonatomic,strong)UIColor* textColor;
@property(nonatomic,assign)NSTextAlignment textAlignment;
+(LabelStyle*)keyAndNormalStyle;
+(LabelStyle*)wordTitlestyle;
@end

NS_ASSUME_NONNULL_END
