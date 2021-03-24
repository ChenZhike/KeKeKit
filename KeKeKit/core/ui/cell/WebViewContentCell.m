//
//  WebViewContentCell.m
//  ABAO
//
//  Created by chengxuyuan on 2019/4/8.
//  Copyright © 2019 chengxuyuan. All rights reserved.
//

#import "WebViewContentCell.h"
static CGFloat contentH=0;
@implementation WebViewContentCell
+(void)setSugH:(CGFloat)h
{
    contentH=h;
}
+ (CGFloat)suggestedHWithData:(NSDictionary *)obj
{
    return contentH;
}
- (void)configWithData:(NSObject *)obj
{
    CGFloat h=[[self class]suggestedHWithData:obj];
    self.frame=RECT(0, 0, WINDOWW, h);
    [self.contentView removeSubviews];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
