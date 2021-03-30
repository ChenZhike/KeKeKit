//
//  TeacherListCell.m
//  KeKeKit
//
//  Created by CZK on 2019/8/30.
//  Copyright © 2019 czk. All rights reserved.
//

#import "TeacherListCell.h"
#import "TeacherCollectionViewCell.h"
@implementation TeacherListCell
+ (CGFloat)suggestedHWithData:(NSDictionary *)obj
{
    return 130+58;
}
- (void)configWithData:(NSDictionary *)obj
{
    CGFloat h=[[self class]suggestedHWithData:obj];
    self.frame=RECT(0, 0, WINDOWW, h);
    [self.contentView removeSubviews];
    [self fillTop:obj.allKeys[0]];
    self.datas=obj.allValues[0];
    [self initUI];
    [self.collectionView reloadData];

}
-(void)fillTop:(NSString*)text
{
    UIView*sectionView=[[UIView alloc]init];
    sectionView.frame=RECT(0, 10, WINDOWW, 48);
    UIFont*font=font(17);
    UILabel*alab=[[UILabel alloc]initWithFrame:CGRectMake(10, 11, 100, font.pointSize)];
    alab.font=font;
    alab.textColor=BlackColor;
    alab.text=text;
    alab.textAlignment=NSTextAlignmentLeft;

    [sectionView addSubview:alab];
    [self.contentView addSubview:sectionView];



}
-(void)initUI{

    CGFloat h=[[self class]suggestedHWithData:nil];
    CGFloat col_h=h-58;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init]; layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        //2.初始化collectionView
    UICollectionView*mainCollectionView = [[UICollectionView alloc] initWithFrame:RECT(0, 58, WINDOWW, col_h) collectionViewLayout:layout];
    mainCollectionView.clipsToBounds=NO;

        //    mainCollectionView
    mainCollectionView.backgroundColor = [UIColor clearColor];
        /// 设置此属性为yes 不满一屏幕 也能滚动
    mainCollectionView.alwaysBounceHorizontal = YES;
    UINib*nib=[UINib nibWithNibName:NSStringFromClass([TeacherCollectionViewCell class]) bundle:nil];
    [mainCollectionView registerNib:nib forCellWithReuseIdentifier:@"TeacherCollectionViewCell"];
    mainCollectionView.showsHorizontalScrollIndicator = NO;
    mainCollectionView.bounces=NO;

        //4.设置代理
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    [self.contentView addSubview:mainCollectionView];

    self.collectionView=mainCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(TeacherCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.openSel) {
        cell.selB.hidden=NO;
//        NSUInteger section=indexPath.section;
        NSUInteger row=indexPath.row;
        if ([self.selindexs containsObject:@(row)]) {
            cell.selB.selected=YES;
        }
        else
            {
            cell.selB.selected=NO;
            }
        [cell.selB addTarget:self action:@selector(selBClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary*data=self.datas[indexPath.row];
    TeacherCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"TeacherCollectionViewCell" forIndexPath:indexPath];
    [cell configWithData:data];

    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, self.collectionView.height);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(15, self.collectionView.height);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(15, self.collectionView.height);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.openSel==NO) {
//        NSUInteger section=indexPath.section;
        NSUInteger row=indexPath.row;
[self.actionDelegate SuperOneTableViewCell:self clickAction:row];
    }

}
-(void)selBClick:(UIButton*)sender
{
    sender.selected=!sender.selected;
    UICollectionViewCell*cell=[sender getCollctionCell];
    NSIndexPath*indexPath=[self.collectionView indexPathForCell:cell];
    
//    NSUInteger section=indexPath.section;
    NSUInteger row=indexPath.row;
    [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    [self.actionDelegate SuperOneTableViewCell:self clickAction:row];
}
- (void)awakeFromNib {
    [super awakeFromNib];
//     [self initUI];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
