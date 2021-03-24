//
//  SuperIVLabBtn.h
//  FirstProject
//
//  Created by CZK on 2019/5/9.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuperIVLabBtn : UIButton
-(id)initWithRect:(CGRect)rect Titles:(NSArray*)titles labstyles:(NSArray*)lss
       titleFrame:(CGRect)titleFrame  ivStrs:(NSArray*)ivStrs
       tintcolors:(NSArray*)tintcolors
          ivFrame:(CGRect)ivFrame;
@property(nonatomic,strong)UILabel* lab;
@property(nonatomic,strong)UIImageView* iv;
@property(nonatomic,strong,nullable)NSArray* titles;
@property(nonatomic,strong,nullable)NSArray* lss;
@property(nonatomic,strong,nullable)NSArray* ivStrs;
@property(nonatomic,strong,nullable)NSArray* tintcolors;
@end

NS_ASSUME_NONNULL_END
