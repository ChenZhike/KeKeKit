//
//  UIButton+Block.h
//  MRDLibrary
//
//  Created by ma ruiduan on 13-2-28.
//  Copyright (c) 2013年 ruiduan ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
//#import "BlockUIDefine.h"

@interface UIButton(Block)
typedef void (^ActionBlock)(id sender);

/**
 UIControlEvents 触发block执行方法,代替指定@select()方法
 @param  controlEvent 触发条件,例如按下按钮,双击按钮
 @param  action 触发执行的block
 */
- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

/**
 按下按钮手抬起的时候触发block,代替指定@select()方法
 @param  block 触发执行的block
 */
- (void)block:(ActionBlock)block;
@end
