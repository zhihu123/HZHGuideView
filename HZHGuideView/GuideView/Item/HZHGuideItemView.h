//
//  HZHGuideItemView.h
//  HZHGuideView
//
//  Created by SNQU on 2017/12/5.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GuideItemDismissBlock)(void);

@interface HZHGuideItemView : UIView


@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property (copy, nonatomic) GuideItemDismissBlock dismissBlock;
@property (assign, nonatomic) NSInteger index;

@end
