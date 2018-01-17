//
//  CWWaveAnimationView.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2018/1/11.
//  Copyright © 2018年 HeChuang. All rights reserved.
//

#import "CWWaveAnimationView.h"

@interface CWWaveAnimationView ()
@property (nonatomic, strong) CADisplayLink * disPlayLink;//屏幕刷新率定时器
@property (nonatomic, strong) CAShapeLayer * waveLayer;//绘制波浪曲线
@property (nonatomic, strong) CAGradientLayer * gradientLayer;//渐变色
@property (nonatomic, strong) NSArray * defaultColorArray;
@property (nonatomic, assign) CGFloat A;
@property (nonatomic, assign) CGFloat ω;
@property (nonatomic, assign) CGFloat φ;
@property (nonatomic, assign) CGFloat k;
@end

@implementation CWWaveAnimationView

- (instancetype)initWithFrame:(CGRect)frame HeightPercent:(CGFloat)heightPercent{
    if (self = [super initWithFrame:frame]) {
        /***  正弦函数 y = Asin(ωx+φ)+k  ***/
        _A = 15;
        _ω = 1.66 * M_PI / CGRectGetWidth(self.frame);
        _φ = 0;
        _k = CGRectGetHeight(self.frame) * (1 - heightPercent);
        self.waveLayer = [CAShapeLayer layer];
        [self.gradientLayer setMask:self.waveLayer];
        [self.layer addSublayer:self.gradientLayer];
        self.disPlayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(setCurrentWave:)];
        [self.disPlayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)setCurrentWave:(CADisplayLink *)sender{
    CGMutablePathRef path =CGPathCreateMutable();
    CGFloat y = CGRectGetHeight(self.frame);
    CGFloat width = CGRectGetWidth(self.frame);
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= width; x++) {
        y = _A * sin(_ω * x + _φ) + _k;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, width, CGRectGetHeight(self.frame));
    CGPathAddLineToPoint(path, nil, 0, CGRectGetHeight(self.frame));
    CGPathCloseSubpath(path);
    self.waveLayer.path = path;
    CGPathRelease(path);
    _φ += 0.4 / M_PI;
}

- (void)setGradualColorsArray:(NSArray<UIColor *> *)gradualColorsArray{
    NSMutableArray * colors = [[NSMutableArray alloc] init];
    for (UIColor * color in gradualColorsArray) {
        [colors addObject:(__bridge id)color.CGColor];
    }
    self.gradientLayer.colors = colors;
    self.gradientLayer.locations = [self setColorsLocationWithCount:colors.count];
}

- (NSArray<NSNumber *> *)setColorsLocationWithCount:(NSInteger)count{
    CGFloat d = 1.0 / count;
    NSMutableArray * mutableArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < count; i++) {
        NSNumber * num = @(d + d * i);
        [mutableArray addObject:num];
    }
    return mutableArray;
}

#pragma mark - lazyload
- (CAGradientLayer *)gradientLayer{
    if (_gradientLayer == nil) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        _gradientLayer.colors = self.defaultColorArray;
        _gradientLayer.locations = [self setColorsLocationWithCount:self.defaultColorArray.count];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(0, 1);
    }
    return _gradientLayer;
}

- (NSArray *)defaultColorArray{
    if (_defaultColorArray == nil) {
        UIColor * color1 = [UIColor colorWithRed:164/255.0
                                           green:216/255.0
                                            blue:222/255.0
                                           alpha:1];
        UIColor * color2 = [UIColor colorWithRed:105/255.0
                                           green:192/255.0
                                            blue:154/255.0
                                           alpha:1];
        _defaultColorArray = @[(__bridge id)color1.CGColor,
                               (__bridge id)color2.CGColor];
    }
    return _defaultColorArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
