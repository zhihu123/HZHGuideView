//
//  HZHGuideItemView.m
//  HZHGuideView
//
//  Created by SNQU on 2017/12/5.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import "HZHGuideItemView.h"
#import <FLAnimatedImage.h>
#import <YLImageView.h>
#import <YLGIFImage.h>
#import <YYImage.h>


@interface HZHGuideItemView()
{
    UIImage *_gifImage;
}
@end

@implementation HZHGuideItemView

- (void)awakeFromNib{
    [super awakeFromNib];
    // 添加登录成功的通知
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(scrollPage:)
                                                 name:@"GuidePage"
                                               object:nil];
    
}

- (void)scrollPage:(NSNotification *)notification{
    NSDictionary *info = notification.userInfo;
    NSString *pageStr = info[@"page"];
    NSInteger page = [pageStr integerValue];
    
    switch (page) {
        case 0:
            [_jumpBtn setHidden:YES];
            break;
        case 1:
            [_jumpBtn setHidden:YES];
            break;
        case 2:
            [_jumpBtn setHidden:YES];
            break;
        default:
            [_jumpBtn setHidden:NO];
            break;
    }
    
}
- (IBAction)dismissAction:(id)sender {
    if (self.dismissBlock) {
        self.dismissBlock();
    }
}


- (void)setIndex:(NSInteger)index{
    _index = index;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"guide_gif_%ld", (long)index] ofType:@"gif"];
//        FLAnimatedImage *flaImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:path]];
        NSString *imageName = [NSString stringWithFormat:@"guide_gif_%ld.gif", (long)index];
        dispatch_async(dispatch_get_main_queue(), ^{
            
//            FLAnimatedImageView *imageView1 = [[FLAnimatedImageView alloc] init];
//            imageView1.contentMode = UIViewContentModeScaleAspectFill;
//            imageView1.clipsToBounds = YES;
//            imageView1.frame = CGRectMake(0, 80, self.frame.size.width, self.frame.size.width);
//            [self addSubview:imageView1];
//            imageView1.animatedImage = flaImage;
            
//            YLImageView* imageView = [[YLImageView alloc] initWithFrame:CGRectMake(0, 80, self.frame.size.width, self.frame.size.width)];
//            [self addSubview:imageView];
//            imageView.image = [YLGIFImage imageNamed:imageName];
            
            UIImage *image = [YYImage imageNamed:imageName];
            UIImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(0, 80, self.frame.size.width, self.frame.size.width);
            [self addSubview:imageView];
            
        });
    });
    
    
    
    
    
    
}

- (NSArray *)animationImagesWithPage:(NSString *)pageStr
{
    NSFileManager *fielM = [NSFileManager defaultManager];
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"guide_%@", pageStr] ofType:@"bundle"];
    NSArray *arrays = [fielM contentsOfDirectoryAtPath:path error:nil];
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < arrays.count; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%@",@(i)];
        
        [tempArray addObject:fileName];
    }
    NSMutableArray *imagesArr = [NSMutableArray array];
    for (NSString *name in tempArray) {
        NSString *imagePath = [NSString stringWithFormat:@"%@/%@", path, name];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        if (image) {
            [imagesArr addObject:image];
        }
    }
    return imagesArr;
}


- (void)dealloc{
    NSLog(@"%s", __func__);
    [_gifImageView stopAnimating];
    _gifImageView.animationImages = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
