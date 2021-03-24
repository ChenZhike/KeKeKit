//
//  HistoryOrLoveVC.h
//  Movie
//
//  Created by 阿文 on 3018/9/23.
//  Copyright © 3018年 awen. All rights reserved.
//

#import "SuperJustSimpleVC.h"
@interface LocalFilesManagerVC : SuperJustSimpleVC
@property(nonatomic,assign)BOOL hideHiddenFile;//不展示隐藏文件
@property(nonatomic,copy,nullable)NSString*dirpath;
@property(nonatomic,assign)BOOL isEditing;
@property(nonatomic,strong)NSMutableArray* selectedRows;
@property(nonatomic,strong)NSMutableArray* selected_url_datas;
@property(nonatomic,assign)int export_index;
@property(nonatomic,strong)UIView* bottomView;
@property(nonatomic,strong)UIButton* selB;

@property(nonatomic,strong,nullable)UIButton* editB;
@end
