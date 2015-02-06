//
//  SeibelCurve.m
//  SeibelCurveDemo
//
//  Created by 赵进雄 on 14-7-7.
//  Copyright (c) 2014年 zhaojinxiong. All rights reserved.
//

#import "SeibelCurve.h"

@implementation SeibelCurve

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        _edgeInsets = UIEdgeInsetsMake(30, 20, 30, 20); // (CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
        _linesColor = [UIColor grayColor];  //  初始化曲线颜色
    }
    return self;
}

- (NSNumber *)maxDataPoint {
    if (_maxDataPoint) {
        return _maxDataPoint;
    } else {
        __block NSNumber *max = self.dataPointArray[0];
        [self.dataPointArray enumerateObjectsUsingBlock:^(NSNumber *n, NSUInteger idx, BOOL *stop) {
            if ([n compare: max ] == NSOrderedDescending)
                max = n;
        }];
        return max;
    }
}

- (NSNumber *)minDataPoint {
    if (_minDataPoint) {
        return _minDataPoint;
    } else {
        __block NSNumber *min = (NSNumber *)self.dataPointArray[0];
        [self.dataPointArray enumerateObjectsUsingBlock:^(NSNumber *n, NSUInteger idx, BOOL *stop) {
            if ([n compare: min ] == NSOrderedAscending)
                min = n;
        }];
        return min;
    }
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // STYLE
    // lines color
    [self.linesColor setStroke];
    // lines width
    CGContextSetLineWidth(context, 2);   // 设置曲线的粗细
    
    // CALCOLO I PUNTI DEL GRAFICO
    NSInteger count = self.dataPointArray.count;
    CGPoint graphPoints[count];
    
    CGFloat drawingWidth, drawingHeight, min, max;
    
    drawingWidth = rect.size.width - self.edgeInsets.left - self.edgeInsets.right;
    drawingHeight = rect.size.height - self.edgeInsets.top - self.edgeInsets.bottom;
    
    min = ((NSNumber *)[self minDataPoint]).floatValue;
    max = ((NSNumber *)[self maxDataPoint]).floatValue;
    
    if (count > 1) {
        for (int i = 0; i < count; ++i) {
            CGFloat x, y, dataPointValue;
            
            dataPointValue = ((NSNumber *)self.dataPointArray[i]).floatValue;
            
            x = self.edgeInsets.left + (drawingWidth/(count-1))*i;  // 画线的起始x坐标
            if (max != min)
                y = rect.size.height - ( self.edgeInsets.bottom + drawingHeight*( (dataPointValue - min) / (max - min) ) );
            else // il grafico si riduce a una retta
                y = rect.size.height/2;
            
            graphPoints[i] = CGPointMake(x, y);
            
            // 节点图片
            self.imgView = [[UIImageView alloc]init];
            self.imgView.frame = CGRectMake(graphPoints[i].x - 6, graphPoints[i].y - 4, 9, 9);
            [self.imgView setImage:[UIImage imageNamed:@"note_image.png"]];
            [self addSubview:self.imgView];
            
            // 文字描述
            UILabel *content = [[UILabel alloc]init];
            content.frame = CGRectMake(graphPoints[i].x - 13, graphPoints[i].y-23, 25, 13);
            content.text = [NSString stringWithFormat:@"%@",[self.dataPointArray objectAtIndex:i]];
            content.font = [UIFont systemFontOfSize:12.f];
            content.textAlignment =  NSTextAlignmentCenter;
            content.backgroundColor = [UIColor clearColor];
            [self addSubview:content];
        }
    } else if (count == 1) {
        // pongo il punto al centro del grafico
        graphPoints[0].x = drawingWidth/2;
        graphPoints[0].y = drawingHeight/2;
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"请设置数据" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    // DISEGNO IL GRAFICO
    CGContextAddLines(context, graphPoints, count);
    CGContextStrokePath(context);
    
}

@end
