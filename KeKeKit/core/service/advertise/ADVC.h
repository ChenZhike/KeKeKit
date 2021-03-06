//
//  ADVC.h
//  KeKeKit
//
//  Created by KeKe on 3018/10/6.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADVC : UIViewController
@property(nonatomic,strong,nullable)NSMutableArray* nos;
@property(nonatomic,assign)int nowNum;
@property(nonatomic,strong)NSTimer* timer;
@property(nonatomic,strong)NSArray* bannerList;
@property(nonatomic,strong)NSDictionary* nowDic;
@property (weak, nonatomic) IBOutlet UIImageView *adIV;
- (IBAction)backBtnClick:(id)sender;

- (IBAction)changeBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *changeB;

@end
