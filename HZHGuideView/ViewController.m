//
//  ViewController.m
//  HZHGuideView
//
//  Created by SNQU on 2017/12/5.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import "ViewController.h"
#import "HZHGuideView.h"
#import "HZHGuideItemView.h"

@interface ViewController ()

@property (strong, nonatomic) HZHGuideView *guideView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showGuideView];
    
}

#pragma mark - 引导页
- (void)showGuideView{
    NSMutableArray *views = [NSMutableArray arrayWithCapacity:0];
    __weak typeof(self) weakSelf = self;
    for (NSInteger i = 0; i < 4; i++) {
        HZHGuideItemView *itemView = [[[NSBundle mainBundle] loadNibNamed:@"HZHGuideItemView" owner:self options:nil] objectAtIndex:0];
        itemView.index = i;
        itemView.dismissBlock = ^{
            [weakSelf.guideView dismissAnimation];
        };
        [views addObject:itemView];
    }
    HZHGuideView *guideView = [[HZHGuideView alloc] initWithFrame:self.view.bounds];
    [guideView updateDataWithViews:views];
    
    guideView.selectBlock = ^(NSInteger page){
        NSLog(@"=======页面滑动到第%ld页",(long)page);
        NSString *pageStr = [NSString stringWithFormat:@"%ld", (long)page];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GuidePage" object:nil userInfo:@{@"page" : pageStr}];
    };
    
    
    __weak typeof(HZHGuideView) *weakGuideView = guideView;
    guideView.dismissBlock = ^(BOOL dismiss){//消失回调
        [weakGuideView dismissAnimation];
    };
    self.guideView = guideView;
    [self.view addSubview:guideView];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GuidePage" object:nil userInfo:@{@"page" : @"0"}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
