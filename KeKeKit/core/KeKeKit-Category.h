//
//  Category.h
//  KeKeKit
//
//  Created by KeKe on 15/8/17.
//  Copyright (c) 2015年 KeKeKit. All rights reserved.
//

#ifndef KeKeKit_Category_h
#define KeKeKit_Category_h
#ifdef DEBUG
#define LOG(...) NSLog(__VA_ARGS__)
#else
#define LOG(...)
#endif
#import "ViewDefine.h"
//#import "AppDelegate.h"
#import "GlobalConst.h"
#import "InfoHelper.h"
#import "GlobalAttributeDic.h"
#import "UibodyDefine.h"
#import "UIColor+HexStr.h"
#import "UIColor+RGBValues.h"
#import "NSObject+Convert.h"
#import "NSArray+IndexOutOfCount.h"
#import "NSArray+Compare.h"
#import "NSArray+Parse.h"
#import "NSMutableArray+Change.h"
#import "NSData+Common.h"
#import "NSData+ImageContentType.h"
#import "NSDate+TianShi.h"
#import "NSDictionary+Null.h"
#import "NSDictionary+Parameters.h"
#import "NSMutableDictionary+Null.h"
#import "NSUserDefaults+Null.h"
#import "NSNumber+Calcutate.h"
#import "NSNumber+moneyValue.h"
#import "NSString+Calcute.h"
#import "NSString+CheckFormat.h"
#import "NSString+Compare.h"
#import "NSString+Date.h"
#import "NSString+Edit.h"
#import "NSString+Encry.h"
#import "NSString+File.h"
#import "NSString+Parameters.h"
#import "NSString+ParseLanguage.h"
#import "NSString+PopularStyle.h"
#import "NSString+ShowFit.h"
#import "NSString+Version.h"
#import "NSString+tool.h"

#import "NSAttributedString+HeightCalculated.h"
#import "NSData+AES256.h"
#import "NSIndexPath+Equal.h"

#import <UIKit/UIKit.h>
//#import "EBDate.h"
//
//
#import "UIView+Frame.h"
#import "UIView+CommonUI.h"
#import "UIView+Extension.h"
#import "UIView+i7Rotate360.h"
#import "UIView+SonSuperView.h"
#import "UIView+Animation.h"
#import "UIView+QuickUI.h"
#import "UIImage+Color.h"
#import "UILabel+QuickUI.h"
#import "UILabel+Gradient.h"
#import "UITextField+PlaceHolderColor.h"
#import "UITextView+Style.h"
#import "UIImageView+setImage.h"
#import "UIButton+Color.h"
#import "UIButton+Block.h"
#import "UIButton+QuickUI.h"

#import "UIButton+WebCache.h"

#import "UITableViewCell+CleanSelectionStyle.h"
#import "UIViewController+ShiPei.h"



#import "NetObj.h"
#import "UserInfoManager.h"
#import "VerticallyAlignedLabel.h"
#import "SuperOneTableViewCell.h"
#import "SuperOneVC.h"
#import "Super2VC.h"
#import "UrlsManager.h"
#import "FunctionDefaultVC.h"
#import "ChangeVCManager.h"
#import "KeKeAppDelegate.h"
#import "SVProgressHUD.h"
#import "MJRefresh.h"
#endif
