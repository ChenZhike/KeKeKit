//
//  StudentListCell.h
//  KeKeKit
//
//  Created by CZK on 2019/9/7.
//  Copyright © 2019 czk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StudentListCell : SuperOneTableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSArray* datas;
@property(nonatomic,strong)NSArray* selindexs;
@property(nonatomic,strong,nullable)UICollectionView* collectionView;
@property(nonatomic,assign)BOOL openSel;
@end

NS_ASSUME_NONNULL_END
