//
//  ImgsCell.m
//  KeKeKit
//
//  Created by CZK on 2019/4/1.
//  Copyright © 2019 czk. All rights reserved.
//

#import "ImgsCell.h"

@implementation ImgsCell
+ (CGFloat)suggestedHWithData:(NSArray *)obj
{
    CGFloat h=0;
    for (int i=0; i<obj.count; i++) {
        NSDictionary*dic=obj[i];
        CGFloat ratio=[[dic objectForKey:@"ratio"]floatValue];
        CGFloat nowh=WINDOWW*ratio;
        h+=nowh;
    }
    return h;
}
- (void)configWithData:(NSArray *)obj
{
    CGFloat h=[[self class]suggestedHWithData:obj];
    self.frame=RECT(0, 0, WINDOWW, h);
    [self.contentView removeSubviews];
    CGFloat nowY=0;
    for (int i=0; i<obj.count; i++) {
        NSDictionary*dic=obj[i];
        CGFloat ratio=[[dic objectForKey:@"ratio"]floatValue];
        NSString*name=[dic objectForKey:@"name"];
        CGFloat nowh=WINDOWW*ratio;
        NSString*imgstr=name;
        UIImageView*iv=[[UIImageView alloc]initWithFrame:RECT(0, nowY, WINDOWW, nowh)];
        UIImage*image=[UIImage imageNamed:imgstr];
        iv.image=image;

        [self.contentView addSubview:iv];

        nowY+=nowh;
    }
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
