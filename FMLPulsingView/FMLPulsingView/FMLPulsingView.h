//
//  FMLPulsingView.h
//  FMLPulsingView
//
//  Created by Damien on 16/3/31.
//  Copyright © 2016年 Damien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMLPulsingView : UIView

///脉冲的个数
@property (nonatomic, assign) NSUInteger pulsingCount;

///脉冲开始的半径
@property (nonatomic, assign) CGFloat startRadius;

///脉冲的半径
@property (nonatomic, assign) CGFloat radius;

///脉冲的颜色
@property (nonatomic, strong) UIColor *pulsingColor;

- (void)startAnimation;

- (void)stopAnimation;
@end
