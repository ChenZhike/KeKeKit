//
//  SceneDelegate.h
//  KeKeKit
//
//  Created by 陈志科 on 2020/10/7.
//

#import <UIKit/UIKit.h>

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;

@property(nonatomic,assign)BOOL askpay;
@property(nonatomic,strong)NetObj* no;//第一个接口
@property(nonatomic,strong)NetObj* no1;//查询支付状态接口
@property(nonatomic,copy)NSString*tradeNo;//交易编号
-(void)purchaseWantDisAppear:(NSString*)payurl oldWin:(UIWindow*)oldwin tradeNo:(NSString*)tradeNo;
@end

