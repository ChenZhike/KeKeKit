//
//  ListCellRequestManager.m
//  ZiLuoLan
//
//  Created by 陈志科 on 2020/5/25.
//  Copyright © 2020 lingxin. All rights reserved.
//

#import "ListCellRequestManager.h"
static ListCellRequestManager*sharedCellRequestManager=nil;
@interface ListCellRequestManager ()

@end

@implementation ListCellRequestManager
+(ListCellRequestManager*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCellRequestManager=[[ListCellRequestManager alloc]init];
    });
    return sharedCellRequestManager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray*muarr=[[NSMutableArray alloc]init];
        self.nos=muarr;
    }
    return self;
}
-(NSArray*)cell_names
{
    return @[@"VideoCell"];
}
-(void)voidmethod
{

}
-(void)SuperOneTableViewCell:(SuperOneTableViewCell *)cell clickAction:(int)index
{
    NSString*class_str=NSStringFromClass([cell class]);
    @synchronized (self) {
        if (!self.is_request_body) {
                if ([[self cell_names]containsObject:class_str]) {
                    NSString*selStr=[NSString stringWithFormat:@"deal%@",class_str];
                    self.change_UI_cell=cell;
                    self.click_data=cell.data;
                    self.clickAction=index;
                    [self performSelector:NSSelectorFromString(selStr)];
                }
        }
    }
}
#pragma mark-方法区
#pragma mark-保留区
-(void)updateRelatedSavedDataAndUI
{
//    NSDictionary*dic=self.change_data_muarr[self.change_data_index];
    NSMutableDictionary*mudic=[[NSMutableDictionary alloc]initWithDictionary:self.click_data];
    [mudic setValuesForKeysWithDictionary:self.success_replace];
    self.click_data=mudic;

    SuperOneTableViewCell*cell=self.change_UI_cell;

    [cell configWithData:self.click_data];

    SuperOneVC*vc=(SuperOneVC*)cell.actionDelegate;
    NSIndexPath*indexPath=[vc.tableView indexPathForCell:cell];
    NSUInteger section=indexPath.section;
    NSUInteger row=indexPath.row;
    NSMutableArray*arr=vc.totalDatas[section];
    [arr replaceObjectAtIndex:row withObject:self.click_data];



}
-(void)dealCellUpdateRequest:(NSDictionary*)resnfo
{
//    NSString*retCode=[resnfo objectForKey:@"retCode"];
    if ([NetObj ok_return:resnfo]) {
        [SVProgressHUD showSuccessWithStatus:[resnfo objectForKey:@"retMsg"]];
        if (self.success_replace) {
            [self updateRelatedSavedDataAndUI];
        }
    }
    else
        {
        [SVProgressHUD showErrorWithStatus:[resnfo objectForKey:@"retMsg"]];
        }
    [self cleanRequested];

}
-(void)cleanRequested
{
    NSMutableArray*will_dels=[[NSMutableArray alloc]init];
    for (NetObj*no in self.nos) {
        if (no.responsed) {
            [will_dels addObject:no];
        }
    }
    [self.nos removeObjectsInArray:will_dels];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
