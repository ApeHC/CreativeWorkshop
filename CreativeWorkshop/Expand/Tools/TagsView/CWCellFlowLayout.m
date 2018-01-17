//
//  CWCellFlowLayout.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/12/27.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "CWCellFlowLayout.h"

@interface CWCellFlowLayout (){
    CGFloat _sumCellWidth;
}
@end

@implementation CWCellFlowLayout

- (instancetype)initWithCellType:(AlignType)cellType BetweenOfCell:(CGFloat)betweenOfCell{
    if (self = [super init]) {
        _betweenOfCell = betweenOfCell;
        _alignType = cellType;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = kBetweenOfCellDefault;
        self.minimumInteritemSpacing = _betweenOfCell;
        self.sectionInset = UIEdgeInsetsMake(kBetweenOfCellDefault,
                                             kBetweenOfCellDefault,
                                             kBetweenOfCellDefault,
                                             kBetweenOfCellDefault);
    }
    return self;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray * layoutAttributes_t = [super layoutAttributesForElementsInRect:rect];
    NSArray * layoutAttributes = [[NSArray alloc] initWithArray:layoutAttributes_t copyItems:YES];
    NSMutableArray * layoutAttributesTemp = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < layoutAttributes.count; i++) {
        //当前Cell位置信息
        UICollectionViewLayoutAttributes * currentAttributes = layoutAttributes[i];
        //上个Cell位置信息
        UICollectionViewLayoutAttributes * lastAttributes = i == 0 ? nil : layoutAttributes[i-1];
        //下个Cell位置信息
        UICollectionViewLayoutAttributes * nextAttributes = i == (layoutAttributes.count - 1) ? nil : layoutAttributes[i+1];
        //当前Cell信息存进数组
        [layoutAttributesTemp addObject:currentAttributes];
        //累加单行Cell宽度总和
        _sumCellWidth += currentAttributes.frame.size.width;
        //用Origin.与判断是否同行
        CGFloat currentY = CGRectGetMaxY(currentAttributes.frame);
        CGFloat lastY = lastAttributes == nil ? 0 : CGRectGetMaxY(lastAttributes.frame);
        CGFloat nextY = nextAttributes == nil ? 0 : CGRectGetMaxY(nextAttributes.frame);
        if (currentY != lastY && currentY != nextY) {//当前Cell单独占一行
            if ([currentAttributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
                //判断是否为Header
                [layoutAttributesTemp removeAllObjects];
                _sumCellWidth = 0.0;
            }else if ([currentAttributes.representedElementKind isEqualToString:UICollectionElementKindSectionFooter]){
                //判断是否为Footer
                [layoutAttributesTemp removeAllObjects];
                _sumCellWidth = 0.0;
            }else{
                //判断是否为Cell,调整
                [self setCellFrameWith:layoutAttributesTemp];
            }
        }else if (currentY != nextY){//当前Cell与上一个Cell在同一行. 调整
            [self setCellFrameWith:layoutAttributesTemp];
        }
    }
    return layoutAttributes;
}

/**
 调整Cell位置

 @param layoutAttributes 位置信息数组
 */
- (void)setCellFrameWith:(NSMutableArray*)layoutAttributes{
    CGFloat nowWidth;
    switch (_alignType) {
        case AlignTypeWithLeft:
            nowWidth = self.sectionInset.left;
            for (UICollectionViewLayoutAttributes * attributes in layoutAttributes) {
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth;
                attributes.frame= nowFrame;
                nowWidth += nowFrame.size.width + _betweenOfCell;
            }
            _sumCellWidth = 0.0;
            [layoutAttributes removeAllObjects];
            break;
        case AlignTypeWithCenter:
            nowWidth = (self.collectionView.frame.size.width - _sumCellWidth - ((layoutAttributes.count - 1) * _betweenOfCell)) / 2;
            for (UICollectionViewLayoutAttributes * attributes in layoutAttributes) {
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth;
                attributes.frame = nowFrame;
                nowWidth += nowFrame.size.width + self.betweenOfCell;
            }
            _sumCellWidth = 0.0;
            [layoutAttributes removeAllObjects];
            break;
    }
}

@end
