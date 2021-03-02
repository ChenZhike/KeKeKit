//
//  VerticallyAlignedLabel.h
// KeKeKit
//
//  Created by awen on 15/6/24.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
typedef enum VerticalAlignment {
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;
@interface VerticallyAlignedLabel : UILabel
{
@private
    VerticalAlignment verticalAlignment_;
}

@property (nonatomic, assign) VerticalAlignment verticalAlignment;
@end
