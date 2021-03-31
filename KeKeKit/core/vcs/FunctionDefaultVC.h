//
//  FunctionDefaultVC.h
//  KeKeKit
//
//  Created by CZK on 16/1/13.
//  Copyright © 2016年 keke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Super2VC.h"
@interface FunctionDefaultVC : Super2VC
@property(nonatomic,assign)BOOL hideTopNavi;//是否需要隐藏导航条
@property(nonatomic,assign)BOOL isLocalFile;//是否是本地文件
@property(nonatomic,assign)BOOL isPresent;//是否是present进去的，推送有可能会用。
@property(nonatomic,assign)BOOL specialCode;//特殊的中文编码转换
@property(nonatomic,copy,nullable)NSString*finished_jsstr;
@property(nonatomic,strong)UIColor*themeColor;
@property(nonatomic,assign)BOOL loadedReadyBeforeShow;
@property(nonatomic,assign)BOOL isProtol;//是用户协议
@property(nonatomic,strong,nullable)UIViewController* lastVC;
-(id)initWithImageName:(NSString*)imgName;
-(id)initWithUrl:(NSString*)urlstr;
+(FunctionDefaultVC*)protoclVC;
@end
