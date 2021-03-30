//
//  BlackWhiteSheet.h
//  KeKeKit
//
//  Created by CZK on 2019/8/28.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlackWhiteSheet : UIView
-(id)initWithTitles:(NSArray*)titles;
@property(nonatomic,strong)NSMutableArray* btns;
@property(nonatomic,strong)NSArray* titles;
@property(nonatomic,strong,nullable)UIView* btnsBackView;
@property(nonatomic,strong,nullable)UIButton* cancelB;

@end

NS_ASSUME_NONNULL_END
