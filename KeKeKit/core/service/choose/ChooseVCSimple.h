//
//  ChooseVCSimple.h
//  FirstProject
//
//  Created by CZK on 2019/9/6.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SuperJustSimpleVC.h"
@class ChooseVCSimple;
@protocol ChooseVCSimpleDelegate
-(void)pickPerson:(ChooseVCSimple*)cp;
@end
NS_ASSUME_NONNULL_BEGIN

@interface ChooseVCSimple : SuperJustSimpleVC
@property(nonatomic,strong,nullable)UIView* topvie;
@property(nonatomic,strong,nullable)NSMutableArray* selArr;
@property(nonatomic,strong)NSMutableArray* seldatas;
@property(nonatomic,assign)id<ChooseVCSimpleDelegate> persondelegate;

@property(nonatomic,assign)BOOL isOutData;
-(void)reverseSelObj:(NSObject*)obj;
-(void)addBotTiJiaoBtnStyle;
@end

NS_ASSUME_NONNULL_END
