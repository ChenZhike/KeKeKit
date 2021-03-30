//
//  SimpleDatePicker.h
//  KeKeKit
//
//  Created by CZK on 2019/12/19.
//  Copyright © 2019 czk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SimpleDatePicker : TouchView
@property(nonatomic,copy,nullable)NSString*startDateStr;
@property(nonatomic,strong,nullable)UIDatePicker*dp;
@property(nonatomic,assign,nullable)id target;
@property(nonatomic,copy,nullable)NSString*receiveChangedSelStr;
@property(nonatomic,strong,nullable)UIView* cancel_sureVie;
@property(nonatomic,assign,nullable)UIView* may_superView;
@property(nonatomic,strong,nullable)UIView* touchView;
- (instancetype)initWithSuggestedH:(CGFloat)h suggestedBotSpace:(CGFloat)suggestedBotSpace startDateStr:(NSString*)startDateStr superView:(UIView*)superView  target:(id)target receiveChangedSelStr:(NSString*)selStr;
-(void)show;
-(void)dismissPick;
@end

NS_ASSUME_NONNULL_END
