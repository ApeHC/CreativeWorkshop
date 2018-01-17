//
//  CWCellFlowLayout.h
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/12/27.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBetweenOfCellDefault 8

/**
 Cell的对齐方式

 - AlignTypeWithLeft: 左对齐
 - AlignTypeWithCenter: 中间对齐
 */
typedef NS_ENUM(NSInteger, AlignType) {
    AlignTypeWithLeft = 1,
    AlignTypeWithCenter
};

@interface CWCellFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat betweenOfCell;

@property (nonatomic, assign) AlignType alignType;

/**
 初始化

 @param cellType 对齐方式
 @param betweenOfCell Cell的间距(上下左右)
 @return FlowLayout
 */
- (instancetype)initWithCellType:(AlignType)cellType BetweenOfCell:(CGFloat)betweenOfCell;

@end
