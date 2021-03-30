//
//  SuperJustSimpleVC.h
//  KeKeKit
//
//  Created by CZK on 2019/8/31.
//  Copyright © 2019 czk. All rights reserved.
//

#import "SuperOneVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface SuperJustSimpleVC : SuperOneVC
@property(nonatomic,assign)BOOL pureServerDataDeal;
@property(nonatomic,copy,nullable)NSString*urlstr;
@property(nonatomic,copy,nullable)NSString*cellname;
@property(nonatomic,assign)BOOL isnib;
-(void)initSimplePros;
-(void)dealWithNowServerData:(NSDictionary*)resnfo;
- (void)customRequestDic:(NSMutableDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
