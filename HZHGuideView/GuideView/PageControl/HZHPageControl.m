//
//  HZHPageControl.m
//  HZHGuideView
//
//  Created by SNQU on 2017/12/5.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import "HZHPageControl.h"

@implementation HZHPageControl

- (void)setCurrentPage:(NSInteger)page {
    [super setCurrentPage:page];
    NSUInteger subviewIndex = 0;
    for (UIImageView* subview in self.subviews) {
        CGSize size;
        size.height = 8;
        if (subviewIndex == page)
        {
            size.width = 24;
        }else{
            size.width = 8;
        }
        subview.layer.cornerRadius = 4;
        subview.layer.masksToBounds = YES;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                     
                                     size.width,size.height)];
        subviewIndex++;
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
