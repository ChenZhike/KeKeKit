//
//  ChoosePersonVC.m
//  KeKeKit
//
//  Created by CZK on 2019/9/2.
//  Copyright © 2019 czk. All rights reserved.
//

#import "ChoosePersonVC.h"
#import "TeacherListCell.h"
#import "StudentListCell.h"
@interface ChoosePersonVC ()

@end

@implementation ChoosePersonVC
-(NSString*)title
{
    return @"人员选择";
}
-(void)initSimplePros
{
    if (self.is_student) {
        self.cellname=@"StudentListCell";
    }
    else
        {
        self.cellname=@"TeacherListCell";
        }

    self.isnib=NO;
//    self.urlstr=@"/ellricky/manager/searchStudentList";
}
-(void)supplyUI
{
//    [self addBackBtn];



    CGFloat btnW=80;
    CGFloat btnH=30;
    UIButton*btn=[[UIButton alloc]initWithFrame:RECT(WINDOWW-btnW-LeftMargin, NavHeight, btnW, btnH)];
    btn.centerY=NavBtnCenterY;
    [btn setTitleColor:BlackColor forState:UIControlStateNormal];
    btn.titleLabel.font=font(13);
    [btn setTitle:@"全选" forState:UIControlStateNormal];
    [btn setTitle:@"取消全选" forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(right_btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.selB=btn;
    [self.topView addSubview:btn];



    if (!self.topvie) {
        self.topvie=[[UIView alloc]initWithFrame:RECT(0, NavHeight, WINDOWW, 35)];
        [self.view addSubview:self.topvie];
        UIView*fatherView=self.topvie;
        UIFont*font=boldFont(17);
        UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 180, font.pointSize+2)];
        alab.centerY=self.topvie.height/2;
        alab.font=font;
        alab.textColor=BlackColor;
        alab.text=@"";
        alab.textAlignment=NSTextAlignmentLeft;

        [fatherView addSubview:alab];
        alab.tag=1;
    }
    [self addBotTiJiaoBtnStyle];

}

-(void)updateTopView
{
    [self updateNowSelCountLabText];
}
-(void)updateNowSelCountLabText
{
    UILabel*lab=(UILabel*)[self.topvie sonViewWithTag:1];
    lab.text=[NSString stringWithFormat:@"当前已选择 %d人",self.selArr.count];
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(TeacherListCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.openSel=YES;
//    NSUInteger section=indexPath.section;
    NSUInteger row=indexPath.row;
    NSMutableArray*muarr=[[NSMutableArray alloc]init];

    for (NSIndexPath*ip in self.selArr) {
        NSUInteger section1=ip.section;
        NSUInteger row1=ip.row;
        if (row==section1) {
            [muarr addObject:@(row1)];
        }
    }
    cell.selindexs=muarr;
}
-(void)SuperOneTableViewCell:(TeacherListCell *)cell clickAction:(int)index
{
    NSIndexPath*indexPath=[self.tableView indexPathForCell:cell];
    NSIndexPath*ip=[NSIndexPath indexPathForRow:index inSection:indexPath.row];
    [self reverseSelObj:ip];
    [self updateNowSelCountLabText];
    [self ensureSelState];

}
-(void)ensureSelState
{
    if (self.selArr.count==self.totalcount) {
        self.selB.selected=YES;
    }
    else
        {
        self.selB.selected=NO;
        }
    [self updateTopView];
}
-(void)dealWithNowServerData:(NSDictionary*)resnfo
{
    [self dealteacher:resnfo];
}
-(void)dealteacher:(NSDictionary*)resnfo
{
    NSDictionary*data=[resnfo objectForKey:@"data"];
    NSString*headertitles=[data objectForKey:@"title"];
    NSArray*titles=[headertitles componentsSeparatedByString:@","];

    [self.totalDatas removeAllObjects];
    NSMutableArray*ids=[[NSMutableArray alloc]init];
    for (NSDictionary*dic in self.seldatas) {
        [ids addObject:[dic objectForKey:@"id"]];
    }
    NSMutableArray*datas=[[NSMutableArray alloc]init];
    self.selArr=[[NSMutableArray alloc]init];
    self.totalcount=0;
    for (NSString*str in titles) {
        NSArray*arr=[data objectForKey:str];
        for (int i=0; i<arr.count; i++) {
            NSDictionary*dic=arr[i];
            NSObject*aid=[dic objectForKey:@"id"];
            if ([ids containsObject:aid]) {
                NSUInteger index=[titles indexOfObject:str];
                NSIndexPath*ip=[NSIndexPath indexPathForRow:i inSection:index];
                [self.selArr addObject:ip];
            }

        }
        self.totalcount+=arr.count;
        [datas addObject:@{str:arr}];
    }
    [self.totalDatas addObject:datas];
    [self ensureSelState];
}
-(void)right_btnClick:(UIButton*)sender
{
    sender.selected=!sender.selected;
    [self.selArr removeAllObjects];
    if (sender.selected) {
        NSArray*datas=self.totalDatas[0];
        int nowrow=0;
        for (int j=0; j<datas.count; j++) {
            NSDictionary*dic=datas[j];
            NSArray*arr=dic.allValues[0];
                for (int i=0; i<arr.count; i++) {
                NSIndexPath*indexPath=[NSIndexPath indexPathForRow:i inSection:nowrow];
                [self.selArr addObject:indexPath];
                }
                nowrow++;
        }


    }
    [self.tableView reloadData];
    [self updateNowSelCountLabText];
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
