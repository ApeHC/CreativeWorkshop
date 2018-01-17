//
//  CWWaveAnimationView.h
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2018/1/11.
//  Copyright © 2018年 HeChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWWaveAnimationView : UIView

/**
 设置渐变色数组
 */
@property (nonatomic, strong, readwrite) NSArray<UIColor *> * gradualColorsArray;

/**
 初始化

 @param frame frame
 @param heightPercent 波浪位置高度 与 视图总高度的百分比 0.0~1.0之间
 @return CWWaveAnimationView
 */
- (instancetype)initWithFrame:(CGRect)frame HeightPercent:(CGFloat)heightPercent;

@end
