//
//  FloatListView.m
//  LOLNews
//
//  Created by chengxuyuan on 2019/8/21.
//  Copyright © 2019 chengxuyuan. All rights reserved.
//

#import "FloatListView.h"

@implementation FloatListView
-(id)initWithMaxW:(CGFloat)maxW datas:(NSArray*)datas sourceRect:(CGRect)sourceRect
{
    if (self=[super initWithFrame:RECT(0, 0, WINDOWW, WINDOWH)]) {

    }
    self.backgroundColor=[BlackColor colorWithAlphaComponent:0.18];
    self.datas=datas;
    self.sourceRect=sourceRect;
    self.maxW=maxW;

    self.cellH=28;
    //计算整体宽高
    CGFloat w=maxW;
    CGFloat sourceRect_maxX=CGRectGetMaxX(sourceRect);
    CGFloat sourceRect_maxY=CGRectGetMaxY(sourceRect);
    BOOL isleft=(sourceRect_maxX+w)>WINDOWW?YES:NO;
    CGFloat x=isleft?(sourceRect_maxX-w):(sourceRect_maxX);
    CGFloat h=self.cellH*datas.count;
    BOOL isTop=(sourceRect_maxY+h)>WINDOWH;
    CGFloat y=isTop?(sourceRect.origin.y-h):(sourceRect_maxY);
    self.frame=RECT(0, 0, WINDOWW, WINDOWH);


    //具体布局
    self.tableView=[[UITableView alloc]initWithFrame:RECT(x, y, w, h)];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.tableView corner:APPCorner];
    self.tableView.backgroundColor=WhiteColor;
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    //点击事件处理
    //外部使用调试
    return self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellH;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSUInteger section=indexPath.section;
    NSUInteger row=indexPath.row;
    [self.floatListViewDelegate FloatListView:self clickedIndex:row];
    [self removeFromSuperview];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell.contentView removeSubviews];

//    NSUInteger section=indexPath.section;
    NSUInteger row=indexPath.row;
    IVLabModel*ilm=self.datas[row];
    CGFloat ivR=0;
    {
    NSString*imgstr=ilm.keyimgurl;
    UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(LeftMargin, 0, 16, 16)];
    iv.centerY=self.cellH/2;
    ivR=iv.right;
    UIImage*image=[UIImage imageNamed:imgstr];
    iv.image=image;

    [cell.contentView addSubview:iv];
    }
    {
    UIView*fatherView=cell.contentView;
    UIFont*font=font(14);
    CGFloat labX=ivR+LeftMargin;
    CGFloat labW=self.maxW-labX;
    UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(labX, 0, labW, font.pointSize)];
    alab.centerY=self.cellH/2;
    alab.font=font;
    alab.textColor=HexColor(@"");
    alab.text=ilm.text;
    alab.textAlignment=NSTextAlignmentLeft;

    [fatherView addSubview:alab];
    }

    UIView*fatherview=cell.contentView;
    UIView*lineview= [[UIView alloc]initWithFrame:RECT(0, fatherview.height-0.5, fatherview.width, 0.5)];
    lineview.backgroundColor=LineColor;
    [fatherview addSubview:lineview];
}
@end
