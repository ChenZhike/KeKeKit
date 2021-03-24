//
//  FileCell.m
//  FirstProject
//
//  Created by CZK on 2019/12/11.
//  Copyright © 2019 czk. All rights reserved.
//

#import "FileCell.h"

@implementation FileCell
+ (CGFloat)suggestedHWithData:(NSDictionary *)obj
{
    return 44;
}
- (void)configWithData:(NSDictionary *)obj
{
    CGFloat h=[[self class]suggestedHWithData:obj];
    self.frame=RECT(0, 0, WINDOWW, h);
    self.contentView.bounds=RECT(0, 0, WINDOWW, h);
    NSString*name=[obj objectForKey:@"name"];
    NSString*remark=[obj objectForKey:@"remark"];
    if (remark.length) {
        NSString*str=[NSString stringWithFormat:@"%@(%@)",name,remark];
        NSMutableAttributedString*attrstr=[[NSMutableAttributedString alloc]initWithString:str];
        [attrstr addAttribute:NSForegroundColorAttributeName value:BlackColor range:NSMakeRange(0, name.length-1)];
        [attrstr addAttribute:NSForegroundColorAttributeName value:GrayColor range:NSMakeRange(name.length, remark.length+2)];


        self.titleL.attributedText=attrstr;

    }
    else
        {
            self.titleL.text=name;
        }

}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleL.adjustsFontSizeToFitWidth=YES;
    self.contentView.backgroundColor=NatureColorNearlyWhite;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
