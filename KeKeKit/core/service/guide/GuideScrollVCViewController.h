//
//  GuideScrollVCViewController.h
//  KeKeKit
//
//  Created by CZK on 2019/8/18.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuideScrollVCViewController : UIViewController
@property(nonatomic,strong,nullable)UIScrollView* sc;
@property(nonatomic,strong,nullable)NSMutableArray* vies;
@property(nonatomic,strong,nullable)UIPageControl* pc;
@end

NS_ASSUME_NONNULL_END
