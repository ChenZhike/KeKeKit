    //
    //  SectionView.h
    //  FirstProject
    //
    //  Created by KeKe on 3018/9/15.
    //  Copyright © 3018年 awen. All rights reserved.
    //

#import <UIKit/UIKit.h>

@interface SectionView : UIButton
+(CGFloat)Height;
-(id)initWithImgStr:(NSString*)imgstr title:(NSString*)title withMore:(BOOL)withMore;
@end
