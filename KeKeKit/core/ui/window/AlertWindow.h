//
//  AlertWindow.h
//  KeKeKit
//
//  Created by KeKe on 3018/9/27.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,AlertWindowType)
{
    AlertWindowTypeNoSeeTimeToday,
    AlertWindowTypeNoCacheTimeToday,
    AlertWindowTypeNoCommentPower,
};
@interface AlertWindow : UIWindow
@property(nonatomic,strong)UIWindow* oldwin;
@property(nonatomic,copy)NSString*title;
-(id)initWithType:(AlertWindowType)type;
-(id)initWithTitle:(NSString*)title;
-(void)show;
@end
