//
//  SeibelCurve.h
//  SeibelCurveDemo
//
//  Created by 赵进雄 on 14-7-7.
//  Copyright (c) 2014年 zhaojinxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeibelCurve : UIView

// 数据源
@property (nonatomic, strong) NSMutableArray *dataPointArray;
// Style
@property (nonatomic) UIEdgeInsets edgeInsets;
// 曲线颜色
@property (nonatomic, strong) UIColor *linesColor;
// 数组最大值
@property (nonatomic, strong) NSNumber *maxDataPoint;
// 数组最小值
@property (nonatomic, strong) NSNumber *minDataPoint;
// 节点图片
@property (nonatomic, retain)  UIImageView *imgView;

@end
