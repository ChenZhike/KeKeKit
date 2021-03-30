//
//  IVLabs.m
//  KeKeKit
//
//  Created by KeKe on 3018/9/15.
//  Copyright © 2021年 KeKe. All rights reserved.
//

#import "IVLabs.h"
#import "IVLabModel.h"
@implementation IVLabs
+(CGFloat)workHWithILWLayout:(ILWLayout)ilwLayout  ILHLayout:(ILHLayout)ilhLayout labStyle:(LabelStyle*)alabStyle

                       Datas:(NSArray*)datas
{
    CGFloat ivW=(ilwLayout.maxW-ilwLayout.leftMarginW-ilwLayout.rightMarginW-(ilwLayout.perLineDataNum-1)*ilwLayout.innerspaceMarginW)/ilwLayout.perLineDataNum;
    CGFloat ivB=ilhLayout.ivtopMargin+ilhLayout.ivPofHW*ivW;
    CGFloat labB=ivB+ilhLayout.innerspaceMarginH+alabStyle.font.pointSize;
    CGFloat perlineH=labB+ilhLayout.lBottomMargin;
    int linenum=[@(datas.count) zhengchuplus:ilwLayout.perLineDataNum];
    CGFloat totalH=perlineH*linenum;
    return totalH;
}
-(id)initWithILWLayout:(ILWLayout)ilwLayout  ILHLayout:(ILHLayout)ilhLayout labStyle:(LabelStyle*)alabStyle
                 Datas:(NSArray*)datas
needClipStyle:(BOOL)needClipStyle needCornerRadius:(CGFloat)cornerRadius;
{
    if (self=[super init]) {
        CGFloat maxH=[[self class]workHWithILWLayout:ilwLayout ILHLayout:ilhLayout labStyle:alabStyle Datas:datas];
        CGFloat ivW=(ilwLayout.maxW-ilwLayout.leftMarginW-ilwLayout.rightMarginW-(ilwLayout.perLineDataNum-1)*ilwLayout.innerspaceMarginW)/ilwLayout.perLineDataNum;
        CGFloat ivB=ilhLayout.ivtopMargin+ilhLayout.ivPofHW*ivW;
        CGFloat labB=ivB+ilhLayout.innerspaceMarginH+alabStyle.font.pointSize;
        CGFloat perlineH=labB+ilhLayout.lBottomMargin;
        self.ils=[[NSMutableArray alloc]init];


        self.frame=RECT(0, 0, ilwLayout.maxW, maxH);
            //        self.backgroundColor=[UIColor purpleColor];

        int linenum=datas.count%ilwLayout.perLineDataNum==0?datas.count/ilwLayout.perLineDataNum:(datas.count/ilwLayout.perLineDataNum+1);
        for (int i=0; i<linenum; i++) {
            for ( int j=0; j<ilwLayout.perLineDataNum; j++) {
                int dataindex=i*2+j;
                if (dataindex<datas.count) {
                    IVLabModel*data=datas[dataindex];
                    IVLabel*il=[[IVLabel alloc]init];
                    il.frame=RECT(ilwLayout.leftMarginW+(ivW+ilwLayout.innerspaceMarginW)*j, perlineH*i, ivW, perlineH);


                    [il fillSubViewsWithILWLayout:ilwLayout ILHLayout:ilhLayout labStyle:alabStyle Datas:data];
                    BOOL needclip=NO;
                    if (needClipStyle) {
                        il.iv.contentMode=UIViewContentModeScaleAspectFill;
                        needclip=YES;
                    }
                    if (cornerRadius>0) {
                        if (cornerRadius==IVHG2Corner) {
                            il.iv.layer.cornerRadius=il.iv.height/2;
                        }else
                            {
                            il.iv.layer.cornerRadius=cornerRadius;
                            }
                        needclip=YES;
                    }
                    if (needclip) {
                        il.iv.clipsToBounds=YES;
                    }

                    il.tag=dataindex;
                    [il addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                    [self addSubview:il];
                    [self.ils addObject:il];
                }

            }

        }
    }
    return self;
}

-(void)btnClick:(UIButton*)sender
{
    NSUInteger tag=sender.tag;
    if (self.actionDelegate) {
        [self.actionDelegate IVLabs:self clickAction:tag];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
