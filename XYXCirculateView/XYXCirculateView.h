//
//  XYXCirculateView.h
//  XYXCirculateImage
//
//  Created by vlusi on 16/8/2.
//  Copyright © 2016年 vlusi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYXCirculateView : UIView
/** 其他圆点颜色 */
@property (nonatomic, strong) UIColor *otherColor;
/** 当前圆点颜色 */
@property (nonatomic, strong) UIColor *currentColor;
/** 用于展示的图片数组 */
@property (nonatomic,strong)NSArray *imagesArray;
/** 切换image的时间间隔 */
//@property (nonatomic,assign)NSTimeInterval timeInterval;
@end
