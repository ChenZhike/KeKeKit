//
//  OpenFileVC.h
//  FirstProject
//
//  Created by CZK on 2019/12/11.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuickLook/QuickLook.h>
NS_ASSUME_NONNULL_BEGIN

@interface JustShowOfficeFilesVC : UIViewController<QLPreviewControllerDataSource,QLPreviewControllerDelegate>
@property(nonatomic,copy,nullable)NSString*dirpath;
@property(nonatomic,strong,nullable)NSMutableArray* datas;
@property(nonatomic,assign)BOOL hasShown;
- (instancetype)initWithDirPath:(NSString*)dirpath;
- (instancetype)initWithFileUrls:(NSArray*)fileUrls;
@end

NS_ASSUME_NONNULL_END
