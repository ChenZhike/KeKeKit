    //
    //  SectionView.h
    //  KeKeKit
    //
    //  Created by KeKe on 3018/9/15.
    //  Copyright © 2021年 KeKe. All rights reserved.
    //

#import <UIKit/UIKit.h>

@interface SectionView : UIButton
+(CGFloat)Height;
-(id)initWithImgStr:(NSString*)imgstr title:(NSString*)title withMore:(BOOL)withMore;
@end
