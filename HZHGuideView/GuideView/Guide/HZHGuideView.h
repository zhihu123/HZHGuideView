//
//  HZHGuideView.h
//  HZHGuideView
//
//  Created by SNQU on 2017/12/5.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZHPageControl;

typedef void(^SQGuideViewSelectBlock)(NSInteger page);
typedef void(^SQGuideViewDismissBlock)(BOOL dismiss);
@interface HZHGuideView : UIView<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    HZHPageControl *pageControl;
    NSArray *viewArr;
}
@property (strong, nonatomic) UIScrollView         *scrollView;
@property (strong, nonatomic) NSArray              *viewArr;//视图数组
@property (copy, nonatomic)  SQGuideViewSelectBlock selectBlock;
@property (copy, nonatomic)  SQGuideViewDismissBlock dismissBlock;
@property (strong, nonatomic) HZHPageControl        *pageControl;
@property (strong, nonatomic) UIImage *defaultDotImage;//默认的点
@property (strong, nonatomic) UIColor *selectedDotImage;//选中的点


/**
 添加引导页

 @param views 默认显示的界面
 */
- (void)updateDataWithViews:(NSArray*)views;


/**
 注销引导页
 */
-(void)dismissAnimation;

@end
