//
//  FMLPulsingView.m
//  FMLPulsingView
//
//  Created by Damien on 16/3/31.
//  Copyright © 2016年 Damien. All rights reserved.
//

#import "FMLPulsingView.h"

@interface FMLPulsingView ()
@property (nonatomic, strong) CAAnimationGroup *animationGroup;
@property (nonatomic, strong) CAReplicatorLayer *replicatorLayer;
@property (nonatomic, strong) CALayer *pulsingLayer;
@end

@implementation FMLPulsingView

#pragma mark - initialize

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.replicatorLayer = [CAReplicatorLayer layer];
    self.replicatorLayer.frame = self.bounds;
    [self.layer addSublayer:self.replicatorLayer];
    
    self.pulsingLayer = [CALayer layer];
    self.pulsingLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    self.radius = 60;
    [self.replicatorLayer addSublayer:self.pulsingLayer];
    self.replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.replicatorLayer.instanceCount = 3;

    self.replicatorLayer.instanceDelay = 1;
}

- (void)setPulsingColor:(UIColor *)pulsingColor
{
//    self.replicatorLayer.backgroundColor = pulsingColor.CGColor;
    _pulsingColor = pulsingColor;
    self.pulsingLayer.backgroundColor = self.pulsingColor.CGColor;
    self.pulsingLayer.opacity = 0;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.pulsingLayer.frame = frame;
}

- (void)startAnimation
{
    self.pulsingLayer.opacity = 0;
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = self.pulsingCount;
    animationGroup.repeatCount = INFINITY;
        CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        animationGroup.timingFunction = defaultCurve;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @(self.startRadius / self.radius);
    scaleAnimation.toValue = @1.0;
    scaleAnimation.duration = self.pulsingCount;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = self.pulsingCount;
    opacityAnimation.values = @[@(0.45), @0.45, @0];
    opacityAnimation.keyTimes = @[@0, @(0.2), @1];
    
    NSArray *animations = @[scaleAnimation, opacityAnimation];
    
    animationGroup.animations = animations;
    self.animationGroup = animationGroup;
    [self.pulsingLayer addAnimation:self.animationGroup forKey:@"pulse"];
}


- (void)setPulsingCount:(NSUInteger)pulsingCount
{
    _pulsingCount = pulsingCount;
    self.replicatorLayer.instanceCount = pulsingCount;
}

- (void)setRadius:(CGFloat)radius {
    _radius = radius;
    CGFloat diameter = self.radius * 2;
    self.pulsingLayer.bounds = CGRectMake(0, 0, diameter, diameter);
    self.pulsingLayer.cornerRadius = self.radius;
}

- (void)setStartRadius:(CGFloat)startRadius
{
    _startRadius = startRadius;
}


- (void)stopAnimation
{
    [self.pulsingLayer removeAllAnimations];

}



@end
