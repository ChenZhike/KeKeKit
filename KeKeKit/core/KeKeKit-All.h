//
//  KeKeKit-All.h
//  KeKeKit
//
//  Created by 陈志科 on 2021/3/29.
//

#ifndef KeKeKit_All_h
#define KeKeKit_All_h
#import "KeKeCenter.h"
#import "KeKeKit-Category.h"
#import "ListCellRequestManager.h"
#import "SkinManager.h"
#endif /* KeKeKit_All_h */
/*
 使用方法
 
 在pch中引入
 import "KeKeKit-All.h"
 
 
 让 项目的AppDelegate 继承 KeKeAppDelegate
 在 项目的AppDelegate didFinish中
 执行 super didFinsh……
 
 支持自定义的字段都在各类的h文件的字符串常量声明中
 网络请求-NetObj
 皮肤-SkinManager
 如自定义网络请求-InfoHelper设置请求处理code
 
系统类扩展
直接使用
 */
