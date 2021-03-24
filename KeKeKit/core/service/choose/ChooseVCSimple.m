//
//  ChooseVCSimple.m
//  FirstProject
//
//  Created by CZK on 2019/9/6.
//  Copyright © 2019 czk. All rights reserved.
//

#import "ChooseVCSimple.h"

@interface ChooseVCSimple ()

@end

@implementation ChooseVCSimple

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selArr=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
}
-(void)supplyUI
{


}
-(void)reverseSelObj:(NSObject*)obj
{
    if (![self.selArr containsObject:obj]) {
        [self.selArr addObject:obj];
    }
    else
        {
        [self.selArr removeObject:obj];
        }
}
-(void)wannengBack
{

    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
        {
        [self dismissViewControllerAnimated:YES completion:nil];
        }
}
-(void)addBotTiJiaoBtnStyle
{



    CGFloat back_height=56;
    CGFloat bot_h=[self vc_bot_h];
    CGFloat back_y=WINDOWH-bot_h-back_height;
    UIView*backView=[[UIView alloc]init];
    backView.frame=RECT(0, back_y, WINDOWW, back_height);
    backView.backgroundColor=[UIColor whiteColor];

    {
    UIButton*btn=[UIButton tijiaoBWithTitle:@"提交" target:self sel:@selector(tijiaoClick)];
    btn.centerX=WINDOWW/2;
    btn.y=backView.height/2;
    [backView addSubview:btn];
    }
    [self.view addSubview:backView];
    CGFloat tabley=self.topvie.bottom;
    self.tableView.frame=RECT(0, tabley, WINDOWW, back_y-tabley);
}
-(void)tijiaoClick
{
    NSMutableArray*muarr=[[NSMutableArray alloc]init];
    for (NSIndexPath*indexPath in self.selArr) {
        NSUInteger section=indexPath.section;
        NSUInteger row=indexPath.row;
        NSDictionary*dic=self.totalDatas[0][section];
        NSArray*arr=dic.allValues[0];
        NSDictionary*dic0=arr[row];
        [muarr addObject:dic0];
    }
    self.seldatas=muarr;
    [self.persondelegate pickPerson:self];
    [self wannengBack];
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
