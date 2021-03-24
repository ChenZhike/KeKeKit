//
//  FloatListView.h
//  LOLNews
//
//  Created by chengxuyuan on 2019/8/21.
//  Copyright © 2019 chengxuyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FloatListView;
@protocol FloatListViewDelegate <NSObject>

-(void)FloatListView:(FloatListView*)flv clickedIndex:(int)index;

@end
@interface FloatListView :
UIView<UITableViewDelegate,UITableViewDataSource>
-(id)initWithMaxW:(CGFloat)maxW datas:(NSArray*)datas sourceRect:(CGRect)sourceRect;
@property(nonatomic,strong,nullable)UITableView* tableView;
@property(nonatomic,assign)CGFloat maxW;
@property(nonatomic,strong,nullable)NSArray* datas;
@property(nonatomic,assign)CGRect sourceRect;
@property(nonatomic,assign)CGFloat cellH;
@property(nonatomic,assign)id<FloatListViewDelegate> floatListViewDelegate;
@end

NS_ASSUME_NONNULL_END
