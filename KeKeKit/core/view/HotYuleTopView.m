//
//  HotYuleTopView.m
//  LOLNews
//
//  Created by CZK on 2019/6/25.
//  Copyright © 2019 czk. All rights reserved.
//

#import "HotYuleTopView.h"

@implementation HotYuleTopView
-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titles defalutColor:(UIColor*)defalutColor
       selectColor:(UIColor*)selectColor
              font:(UIFont*)font
       suggestPerW:(CGFloat)suggestPerW
{
    return [self initWithFrame:frame titles:titles defalutColor:defalutColor selectColor:selectColor font:font selectfont:nil suggestPerW:suggestPerW];
}
-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titles defalutColor:(UIColor*)defalutColor
       selectColor:(UIColor*)selectColor
              font:(UIFont*)font
        selectfont:(UIFont*)selectfont
       suggestPerW:(CGFloat)suggestPerW
{

    if (self=[super initWithFrame:frame]) {

        UIScrollView*sc=[[UIScrollView alloc]initWithFrame:self.bounds];
        [self addSubview:sc];
        self.sc=sc;
        self.btns=[[NSMutableArray alloc]init];
        self.normalFont=font;
        self.selectFont=selectfont;
            //        CGFloat innerspace=32.8/750*self.width;
        NSUInteger count=titles.count;
        CGFloat innerspace=(self.width-count*suggestPerW)/(count);

            //        CGFloat sx=innerspace/2;
            //        CGFloat sx=(self.width-innerspace*(titles.count-1)-titles.count*suggestPerW)/2;
        if (innerspace<LeftMargin*2) {
                //            sx=LeftMargin;
            innerspace=LeftMargin*2;
            CGFloat contentW=count*(suggestPerW+innerspace);
            sc.contentSize=CGSizeMake(contentW, sc.height) ;

        }
        else
            {
            sc.contentSize=self.bounds.size ;
            }
        CGFloat btnh=font.pointSize+6;
        CGFloat btny=(self.height-btnh)/2;
        for (int i=0; i<count; i++) {
            UIButton*btn=[[UIButton alloc]initWithFrame:RECT(innerspace/2+i*(suggestPerW+innerspace), btny, suggestPerW, btnh)];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:defalutColor forState:UIControlStateNormal];
            [btn setTitleColor:selectColor forState:UIControlStateSelected];
            btn.titleLabel.font=font;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag=i;
            [sc addSubview:btn];
            [self.btns addObject:btn];
        }
    }
    return self;
}
- (void)btnClick:(UIButton*)sender
{
    for (UIButton*btn in self.btns) {
        if (btn==sender) {
            btn.selected=YES;
            UIFont*font=self.selectFont!=nil?self.selectFont:self.normalFont;
            btn.titleLabel.font=font;
        }
        else
            {
            btn.selected=NO;
            btn.titleLabel.font=self.normalFont;
            }
    }
}
-(void)selectIndex:(int)index
{
    if (index<self.btns.count) {
        UIButton*btn=self.btns[index];
        [self btnClick:btn];
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
