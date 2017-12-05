//
//  HZHGuideView.m
//  HZHGuideView
//
//  Created by SNQU on 2017/12/5.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import "HZHGuideView.h"
#import "HZHPageControl.h"

#define kNumberOfPages viewArr.count?viewArr.count:1
#define kWidth         self.frame.size.width
#define kHight         self.frame.size.height


@implementation HZHGuideView

@synthesize scrollView, pageControl, viewArr;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self addSubview:scrollView];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.scrollsToTop = YES;
        scrollView.delegate = self;
        scrollView.pagingEnabled = YES;
    }
    return self;
}

- (void)updateDataWithViews:(NSArray*)views
{
    //设置scrollView
    NSInteger index = views.count?views.count:1;
    scrollView.contentSize = CGSizeMake(kWidth * index, 0);
    for (NSInteger i = 0; i < index; i ++) {
        UIView *itemView = views[i];
        itemView.frame = CGRectMake(kWidth * i, 0, kWidth, kHight);
        [scrollView addSubview:itemView];
    }
    
    //设置pageControl
    pageControl = [[HZHPageControl alloc] initWithFrame:CGRectMake(0, kHight-60, kWidth, 20)];
    pageControl.numberOfPages = index;
    pageControl.currentPage = 0;
    [pageControl setValue:[UIImage imageNamed:@"dot_unselect"] forKeyPath:@"_pageImage"];
    [pageControl setValue:[UIImage imageNamed:@"dot_selected"] forKeyPath:@"_currentPageImage"];
    
    [self addSubview:pageControl];
}




- (UIView *)view
{
    return scrollView;
}

#pragma mark 重写属性的setter方法


-(void)goAction:(id)sender
{
    [self dismissAnimation];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender
{
    NSLog(@"scrollView.contentOffset.x = %f,scrollView.contentOffset.y = %f ", scrollView.contentOffset.x, scrollView.contentOffset.y);
    NSInteger page = scrollView.contentOffset.x / kWidth;
    pageControl.currentPage = page;
    if (self.selectBlock) {
        self.selectBlock(page);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    
    if (scrollView.contentOffset.x > 3.2 * kWidth) {
        if (self.dismissBlock) {
            self.dismissBlock(YES);
        }
    }
}


-(void)dismissAnimation
{
    [UIView beginAnimations:@"fadeOut" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissAnimationEnd)];
    self.alpha = 0;
    [UIView commitAnimations];
    [self dismissAnimationEnd];
}


-(void)dismissAnimationEnd
{
    [self removeFromSuperview];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
